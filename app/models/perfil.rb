class Perfil < ApplicationRecord
  has_many :usuarios

  include Selectable
end
