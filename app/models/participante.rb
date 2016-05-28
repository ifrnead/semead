# encoding: utf-8

class Participante < ActiveRecord::Base
  devise :database_authenticatable, :confirmable, :recoverable, :validatable
  belongs_to :tipo_participante
  belongs_to :cidade
  belongs_to :pais

  validates :nome, :password_confirmation, :pais_id, :documento, :tipo_participante_id, :instituicao, presence: true
  validates :email, uniqueness: true, email: true
  validates :cidade_id, presence: true, if: "pais_id == 33"
  validates :documento, cpf: true, if: "pais_id == 33"
  validates :password, length: { minimum: 4 }
  validates :necessidades_especiais, presence: true, if: :possui_necessidades_especiais?

  def possui_necessidades_especiais?
    self.possui_necessidades_especiais.present?
  end

  def necessidades_especiais
    if possui_necessidades_especiais?
      @necessidades_especiais
    else
      "Não possui"
    end
  end
end
