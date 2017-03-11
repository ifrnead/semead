class Minicurso < ActiveRecord::Base
  belongs_to :participante # Proponente/ministrante
  has_many :participantes # Inscritos

  validates :titulo, :justificativa, :objetivos, :metodologia, :programacao, :material, :referencias, presence: true, on: :create
  validates :titulo, :justificativa, :objetivos, :metodologia, :programacao, :material, :referencias, :vagas, :local, presence: true, on: :update
  validates :vagas, numericality: { only_integer: true }, on: :update

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

  def self.com_vagas
    minicursos = Array.new
    Minicurso.aprovados.each do |minicurso|
      minicursos << minicurso if minicurso.tem_vagas?
    end
    return minicursos
  end

  def vagas_disponiveis
    self.vagas - self.participantes.size
  end

  def tem_vagas?
    self.vagas_disponiveis > 0
  end

  def carga_horaria
    4
  end
end
