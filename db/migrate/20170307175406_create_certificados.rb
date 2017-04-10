class CreateCertificados < ActiveRecord::Migration
  def change
    create_table :certificados do |t|
      t.text :texto
      t.string :titulo
      t.references :usuario, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
