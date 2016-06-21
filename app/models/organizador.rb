class Organizador < ActiveRecord::Base
  has_one :usuario, as: :autenticavel
  has_many :membros
  has_many :linhas, through: :membros
  has_many :avaliacoes
  has_many :trabalhos, through: :avaliacoes

  validates :nome, presence: true

  accepts_nested_attributes_for :usuario

  def email
    self.usuario.email
  end

  def perfil
    self.usuario.perfil
  end
end