class Organizador < ActiveRecord::Base
  has_one :usuario, as: :autenticavel
  has_many :linhas

  validates :nome, presence: true

  accepts_nested_attributes_for :usuario

  def email
    self.usuario.email
  end

  def perfil
    self.usuario.perfil
  end
end
