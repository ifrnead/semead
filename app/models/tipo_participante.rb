class TipoParticipante < ApplicationRecord
  include Selectable
  has_many :participantes
end
