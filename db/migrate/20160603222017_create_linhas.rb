class CreateLinhas < ActiveRecord::Migration
  def change
    create_table :linhas do |t|
      t.string :nome
      t.string :slug

      t.timestamps null: false
    end
  end
end
