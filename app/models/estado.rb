class Estado < ActiveRecord::Base
  include Selectable
  has_many :cidades
  belongs_to :pais, dependent: :destroy
end
