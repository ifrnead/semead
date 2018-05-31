class CreateInscricoes < ActiveRecord::Migration[4.2]
  def change
    create_table :inscricoes do |t|
      t.references :participante, index: true, foreign_key: true
      t.references :minicurso, index: true, foreign_key: true
      t.boolean :certificado

      t.timestamps null: false
    end
  end
end
