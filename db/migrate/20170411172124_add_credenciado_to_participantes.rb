class AddCredenciadoToParticipantes < ActiveRecord::Migration
  def change
    add_column :participantes, :credenciado, :boolean
  end
end
