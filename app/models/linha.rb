class Linha < ActiveRecord::Base
  belongs_to :coordenador, class_name: 'Organizador'
end
