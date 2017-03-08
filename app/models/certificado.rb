class Certificado < ActiveRecord::Base
  belongs_to :participante
  belongs_to :minicurso
  belongs_to :trabalho

  TIPOS = [ :participacao_evento, :apresentacao_trabalho, :apresentacao_minicurso, :organizacao_evento ]

end
