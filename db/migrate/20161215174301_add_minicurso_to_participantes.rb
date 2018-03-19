class AddMinicursoToParticipantes < ActiveRecord::Migration
  def change
    add_reference :participantes, :minicurso, index: true, foreign_key: true
  end
end
