class CreateCertificados < ActiveRecord::Migration
  def change
    create_table :certificados do |t|
      t.string :tipo
      t.references :participante, index: true, foreign_key: true
      t.references :organizador, index: true, foreign_key: true
      t.references :minicurso, index: true, foreign_key: true
      t.references :trabalho, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
