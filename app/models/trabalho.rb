class Trabalho < ActiveRecord::Base
  belongs_to :linha
  belongs_to :participante
  belongs_to :tipo_trabalho
  has_many :avaliacoes, class_name: 'AvaliacaoTrabalho'

  before_destroy :apagar_arquivo
  after_create :definir_avaliadores

  validates :titulo, :resumo, :linha_id, :tipo_trabalho_id, presence: true

  has_attached_file :arquivo
  validates_attachment :arquivo, presence: true, content_type: { content_type: "application/pdf" }

  def minha_avaliacao(organizador)
    return self.avaliacoes.where(organizador_id: organizador.id).first
  end

  def apagar_arquivo
    self.arquivo.destroy
  end

  def definir_avaliadores
    2.times {
      AvaliacaoTrabalho.create(trabalho: self, organizador: self.linha.proximo_avaliador)
    }
  end

  def situacao
    self.avaliacoes.each do |avaliacao|
      if avaliacao.situacao == AvaliacaoTrabalho::SITUACOES[:pendente]
        return AvaliacaoTrabalho::SITUACOES[:pendente]
      end
    end

    aprovadas = 0
    reprovadas = 0
    outra_linha = 0
    self.situacoes.each do |avaliacao|
      aprovadas = aprovadas + 1 if avaliacao.situacao == AvaliacaoTrabalho::SITUACOES[:aprovado]
      reprovadas = reprovadas + 1 if avaliacao.situacao == AvaliacaoTrabalho::SITUACOES[:reprovado]
      outra_linha = outra_linha + 1 if avaliacao.situacao == AvaliacaoTrabalho::SITUACOES[:outra_linha]
    end

    if aprovadas > reprovadas and aprovadas > outra_linha
      return AvaliacaoTrabalho::SITUACOES[:aprovado]
    elsif reprovadas > aprovadas and reprovadas > outra_linha
      return AvaliacaoTrabalho::SITUACOES[:reprovado]
    elsif outra_linha > aprovadas and outra_linha > reprovadas
      return AvaliacaoTrabalho::SITUACOES[:outra_linha]
    else
      return AvaliacaoTrabalho::SITUACOES[:pendente]
    end
  end
end
