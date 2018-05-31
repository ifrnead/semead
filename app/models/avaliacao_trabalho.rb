class AvaliacaoTrabalho < ApplicationRecord
  belongs_to :trabalho
  belongs_to :organizador
  belongs_to :linha

  before_create :definir_situacao
  before_update :verificar_situacao
  after_update :verificar_discrepancia# , :notificar_autor

  validates :situacao, :atende_normas, :tematica_evento, :linha_tematica, :relevancia, :adequacao, :consistencia, :interlocucao, :originalidade, presence: true, on: :update, unless: :outra_linha?
  validates :parecer, presence: true, if: :reprovado?
  validates :linha_id, :parecer, presence: true, if: :outra_linha?

  SITUACOES = {
    reprovado: -1,
    pendente: 0,
    aprovado: 1,
    outra_linha: 2
  }

  ATENDE_NORMAS = {
    sim: 1,
    nao: 0
  }

  TEMATICA_EVENTO = {
    sim: 1,
    nao: 0
  }

  LINHA_TEMATICA = {
    sim: 1,
    nao: 0
  }

  ITENS = {
    atende: 1,
    parcialmente: 0,
    nao_atende: -1
  }

  def verificar_situacao
    if self.outra_linha?
      self.situacao = SITUACOES[:outra_linha]
    end
  end

  def verificar_discrepancia
    if self.trabalho.avaliacoes_linha_atual.where(situacao: SITUACOES[:pendente]).size > 0
      return
    end

    avaliacoes = self.trabalho.avaliacoes_linha_atual
    if avaliacoes.size == 2
      avaliacao1 = avaliacoes.first
      avaliacao2 = avaliacoes.last

      if avaliacao1.situacao != avaliacao2.situacao
        self.trabalho.atribuir_avaliador
      end

      if avaliacao1.outra_linha? and avaliacao2.outra_linha?
        if avaliacao1.linha.id == avaliacao2.linha.id
          self.trabalho.update_attributes(linha: avaliacao1.linha)
          self.trabalho.definir_avaliadores
        else
          self.trabalho.atribuir_avaliador
        end
      end
    elsif avaliacoes.size == 3
      aprovadas = 0
      reprovadas = 0
      outra_linha = 0
      avaliacoes.each do |avaliacao|
        aprovadas = aprovadas + 1 if avaliacao.situacao == AvaliacaoTrabalho::SITUACOES[:aprovado]
        reprovadas = reprovadas + 1 if avaliacao.situacao == AvaliacaoTrabalho::SITUACOES[:reprovado]
        outra_linha = outra_linha + 1 if avaliacao.situacao == AvaliacaoTrabalho::SITUACOES[:outra_linha]
      end

      if outra_linha > aprovadas and outra_linha > reprovadas
        avaliacao1 = avaliacoes[0]
        avaliacao2 = avaliacoes[1]
        avaliacao3 = avaliacoes[2]

        if avaliacao1.linha_id == avaliacao2.linha_id
          self.trabalho.update_attributes(linha: avaliacao1.linha)
          self.trabalho.definir_avaliadores
        elsif avaliacao1.linha_id == avaliacao3.linha_id
          self.trabalho.update_attributes(linha: avaliacao1.linha)
          self.trabalho.definir_avaliadores
        elsif avaliacao2.linha_id == avaliacao3.linha_id
          self.trabalho.update_attributes(linha: avaliacao2.linha)
          self.trabalho.definir_avaliadores
        end
      end
    end
  end

  def notificar_autor
    if self.trabalho.aprovado?
      AvaliacaoMailer.trabalho_aprovado(self.trabalho).deliver_now
    elsif self.trabalho.reprovado?
      AvaliacaoMailer.trabalho_reprovado(self.trabalho).deliver_now
    end
  end

  def reprovado?
    self.situacao == SITUACOES[:reprovado]
  end

  def aprovado?
    self.situacao == SITUACOES[:aprovado]
  end

  def outra_linha?
    self.linha_tematica == LINHA_TEMATICA[:nao]
  end

  def pendente?
    self.situacao == SITUACOES[:pendente]
  end

  def definir_situacao
    self.situacao = SITUACOES[:pendente]
  end
end
