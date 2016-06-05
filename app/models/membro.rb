class Membro < ActiveRecord::Base
  belongs_to :organizador
  belongs_to :linha
end
