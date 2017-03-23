class AddIsentoToParticipantes < ActiveRecord::Migration
  def change
    add_column :participantes, :isento, :integer
    add_column :participantes, :motivo_isencao, :string
  end
end
