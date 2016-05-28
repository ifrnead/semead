class Pais < ActiveRecord::Base
  include Selectable
  has_many :estados
end
