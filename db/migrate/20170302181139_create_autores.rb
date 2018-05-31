class CreateAutores < ActiveRecord::Migration[4.2]
  def change
    create_table :autores do |t|
      t.string :nome
      t.references :trabalho, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
