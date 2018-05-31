class AddCredenciadoToParticipantes < ActiveRecord::Migration[4.2]
  def change
    add_column :participantes, :credenciado, :boolean
  end
end
