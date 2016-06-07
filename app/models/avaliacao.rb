class Avaliacao < ActiveRecord::Base
  belongs_to :trabalho
  belongs_to :organizador

  before_create :definir_situacao

  SITUACOES = {
    reprovado: -1,
    pendente: 0,
    aprovado: 1
  }

  def definir_situacao
    self.situacao = SITUACOES[:pendente]
  end
end
