class CreateInscricoes < ActiveRecord::Migration
  def change
    create_table :inscricoes do |t|
      t.references :minicurso, index: true, foreign_key: true
      t.references :participante, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
