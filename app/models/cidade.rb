class Cidade < ActiveRecord::Base
  include Selectable
  belongs_to :estado
end
