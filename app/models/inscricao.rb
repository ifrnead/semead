class Inscricao < ActiveRecord::Base
  belongs_to :participante
  belongs_to :minicurso

  validate :disponibilidade_vagas

  def disponibilidade_vagas
    unless self.minicurso.tem_vagas?
      errors.add(:base, "Não existem vagas disponíveis")
    end
  end
end
