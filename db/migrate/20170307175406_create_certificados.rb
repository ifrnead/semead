class CreateCertificados < ActiveRecord::Migration[4.2]
  def change
    create_table :certificados do |t|
      t.text :texto
      t.string :titulo
      t.references :usuario, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
