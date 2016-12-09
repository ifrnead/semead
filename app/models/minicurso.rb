class Minicurso < ActiveRecord::Base
  belongs_to :participante
  has_many :inscricoes
  has_many :participantes, through: :inscricoes

  validates :titulo, :justificativa, :objetivos, :metodologia, :programacao, :material, :referencias, presence: true, on: :create
  validates :titulo, :justificativa, :objetivos, :metodologia, :programacao, :material, :referencias, :vagas, :local, presence: true, on: :update
  validates :vagas, numericality: { only_integer: true }

  before_create :definir_avaliacao

  AVALIACAO = {
    reprovado: -1,
    pendente: 0,
    aprovado: 1
  }

  def definir_avaliacao
    self.avaliacao = AVALIACAO[:pendente]
  end

  def self.aprovados
    self.where(avaliacao: AVALIACAO[:aprovado])
  end
end
