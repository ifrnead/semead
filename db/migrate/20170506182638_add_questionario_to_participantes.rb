class AddQuestionarioToParticipantes < ActiveRecord::Migration
  def change
    add_column :participantes, :respondeu_questionario, :boolean, default: false
    Participante.update_all(respondeu_questionario: false)
  end
end
