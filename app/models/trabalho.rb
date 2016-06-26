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
    self.situacoes.each do |avaliacao|
      aprovadas = aprovadas + 1 if avaliacao.situacao == AvaliacaoTrabalho::SITUACOES[:aprovado]
      reprovadas = reprovadas + 1 if avaliacao.situacao == AvaliacaoTrabalho::SITUACOES[:reprovado]
    end

    if aprovadas > reprovadas
      return AvaliacaoTrabalho::SITUACOES[:aprovado]
    elsif reprovadas > aprovadas
      return AvaliacaoTrabalho::SITUACOES[:reprovado]
    else
      return AvaliacaoTrabalho::SITUACOES[:pendente]
    end
  end
end
