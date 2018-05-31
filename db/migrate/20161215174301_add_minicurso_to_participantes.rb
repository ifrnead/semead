class AddMinicursoToParticipantes < ActiveRecord::Migration[4.2]
  def change
    add_reference :participantes, :minicurso, index: true, foreign_key: true
  end
end
