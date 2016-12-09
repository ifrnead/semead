class Inscricao < ActiveRecord::Base
  belongs_to :minicurso
  belongs_to :participante
end
