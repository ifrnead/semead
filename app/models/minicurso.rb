class Minicurso < ActiveRecord::Base
  belongs_to :participante

  validates :titulo, :justificativa, :objetivos, :metodologia, :programacao, :material, :referencias, presence: true
end
