class Perfil < ActiveRecord::Base
  has_many :usuarios

  include Selectable
end
