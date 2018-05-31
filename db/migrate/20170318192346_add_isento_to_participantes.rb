class AddIsentoToParticipantes < ActiveRecord::Migration[4.2]
  def change
    add_column :participantes, :isento, :integer
    add_column :participantes, :motivo_isencao, :string
  end
end
