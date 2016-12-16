class AddMinicursoToParticipantes < ActiveRecord::Migration
  def change
    add_reference :participantes, :minicurso, index: true, foreign_key: true
    drop_table :inscricoes
  end
end
