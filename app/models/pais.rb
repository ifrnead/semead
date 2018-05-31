class Pais < ApplicationRecord
  include Selectable
  has_many :estados

  def brasil?
    self.id == 33
  end
end
