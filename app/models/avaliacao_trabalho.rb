class AvaliacaoTrabalho < ActiveRecord::Base
  belongs_to :trabalho
  belongs_to :organizador
  belongs_to :linha

  before_create :definir_situacao
  after_update :verificar_discrepancia

  validates :situacao, :atende_normas, :tematica_evento, :tematica_linha, :linha_id, :relevancia, :adequacao, :consistencia, :interlocucao, :originalidade, presence: true, on: :update
  validates :parecer, presence: true, if: :reprovado?
  validates :linha_id, presence: true, if: :outra_linha?

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

  TEMATICA_LINHA = {
    sim: 1,
    nao: 0
  }

  ITENS = {
    atende: 1,
    parcialmente: 0,
    nao_atende: -1
  }

  def verificar_discrepancia
    if self.trabalho.avaliacoes.where(situacao: SITUACOES[:pendente]) > 0
      return
    end

    if self.trabalho.avaliacoes.size == 2
      avaliacao1 = self.trabalho.avaliacoes.first
      avaliacao2 = self.trabalho.avaliacoes.last

      if avaliacao1.situacao != avaliacao2.situacao
        self.trabalho.atribuir_avaliador
      end
    end
  end

  def reprovado?
    self.situacao == SITUACOES[:reprovado]
  end

  def aprovado?
    self.situacao == SITUACOES[:aprovado]
  end

  def outra_linha?
    self.situacao == SITUACOES[:outra_linha]
  end

  def pendente?
    self.situacao == SITUACOES[:pendente]
  end

  def definir_situacao
    self.situacao = SITUACOES[:pendente]
  end
end
