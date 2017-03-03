class CreateAutores < ActiveRecord::Migration
  def change
    create_table :autores do |t|
      t.string :nome
      t.references :trabalho, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
