class CreatePerfis < ActiveRecord::Migration[4.2]
  def change
    create_table :perfis do |t|
      t.string :nome
      t.string :slug

      t.timestamps null: false
    end
  end
end
