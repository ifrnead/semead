class CreateCidades < ActiveRecord::Migration[4.2]
  def change
    create_table :cidades do |t|
      t.integer :codigo
      t.string :nome
      t.references :estado, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
