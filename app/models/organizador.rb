class Organizador < ActiveRecord::Base
  has_one :usuario, as: :autenticavel
  has_many :membros
  has_many :linhas, through: :membros
  has_many :avaliacoes_trabalhos
  has_many :trabalhos, through: :avaliacoes_trabalhos

  accepts_nested_attributes_for :usuario

  def email
    self.usuario.email
  end

  def nome
    self.usuario.nome
  end

  def perfil
    self.usuario.perfil
  end
end
