class CreateLinhas < ActiveRecord::Migration
  def change
    create_table :linhas do |t|
      t.string :nome
      t.references :coordenador, index: true

      t.timestamps null: false
    end
  end
end
