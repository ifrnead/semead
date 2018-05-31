class AddQuestionarioToParticipantes < ActiveRecord::Migration[4.2]
  def change
    add_column :participantes, :respondeu_questionario, :boolean, default: false
    Participante.update_all(respondeu_questionario: false)
  end
end
