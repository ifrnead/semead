class TipoTrabalho < ActiveRecord::Base
  has_many :trabalhos

  include Selectable
end
