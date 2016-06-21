class Trabalho < ActiveRecord::Base
  belongs_to :linha
  belongs_to :participante
  belongs_to :tipo_trabalho
  has_many :avaliacoes

  before_destroy :apagar_arquivo
  after_create :definir_avaliadores

  validates :titulo, :resumo, :linha_id, :tipo_trabalho_id, presence: true

  has_attached_file :arquivo
  validates_attachment :arquivo, presence: true, content_type: { content_type: "application/pdf" }

  def apagar_arquivo
    self.arquivo.destroy
  end

  def definir_avaliadores
    2.times {
      Avaliacao.create(trabalho: self, organizador: self.linha.proximo_avaliador)
    }
  end

  def situacao
    self.avaliacoes.each do |avaliacao|
      if avaliacao.situacao == Avaliacao::SITUACOES[:pendente]
        return Avaliacao::SITUACOES[:pendente]
      end
    end

    aprovadas = 0
    reprovadas = 0
    self.situacoes.each do |avaliacao|
      aprovadas = aprovadas + 1 if avaliacao.situacao == Avaliacao::SITUACOES[:aprovado]
      reprovadas = reprovadas + 1 if avaliacao.situacao == Avaliacao::SITUACOES[:reprovado]
    end

    if aprovadas > reprovadas
      return Avaliacao::SITUACOES[:aprovado]
    elsif reprovadas > aprovadas
      return Avaliacao::SITUACOES[:reprovado]
    else
      return Avaliacao::SITUACOES[:pendente]
    end
  end
end
