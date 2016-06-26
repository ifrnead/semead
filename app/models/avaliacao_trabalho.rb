class AvaliacaoTrabalho < ActiveRecord::Base
  belongs_to :trabalho
  belongs_to :organizador
  belongs_to :linha

  before_create :definir_situacao

  SITUACOES = {
    reprovado: -1,
    pendente: 0,
    aprovado: 1,
    outra_linha: 2
  }

  def definir_situacao
    self.situacao = SITUACOES[:pendente]
  end
end
