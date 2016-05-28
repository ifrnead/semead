class CreatePaises < ActiveRecord::Migration
  def change
    create_table :paises do |t|
      t.string :nome
      t.string :name

      t.timestamps null: false
    end
  end
end
