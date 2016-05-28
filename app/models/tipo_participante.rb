class TipoParticipante < ActiveRecord::Base
  include Selectable
  has_many :participantes
end
