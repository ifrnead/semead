class Linha < ActiveRecord::Base
  has_many :membros
  has_many :organizadores, through: :membros

  include Selectable

  def coordenador
    self.membros.where(coordenador: true)
  end
end
