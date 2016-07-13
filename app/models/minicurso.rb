class Minicurso < ActiveRecord::Base
  belongs_to :participante

  validates :titulo, :justificativa, :objetivos, :metodologia, :programacao, :material, :referencias, presence: true

  before_create :definir_avaliacao

  AVALIACAO = {
    reprovado: -1,
    pendente: 0,
    aprovado: 1
  }

  def definir_avaliacao
    self.avaliacao = AVALIACAO[:pendente]
  end
end
