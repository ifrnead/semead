class CreateTipoParticipantes < ActiveRecord::Migration
  def change
    create_table :tipo_participantes do |t|
      t.string :nome
      t.string :slug

      t.timestamps null: false
    end
  end
end
