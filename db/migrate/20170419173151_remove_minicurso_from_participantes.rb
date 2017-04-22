class RemoveMinicursoFromParticipantes < ActiveRecord::Migration
  def change
    remove_foreign_key :participantes, :minicurso
    remove_reference :participantes, :minicurso
  end
end
