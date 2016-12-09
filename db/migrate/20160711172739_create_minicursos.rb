class CreateMinicursos < ActiveRecord::Migration
  def change
    create_table :minicursos do |t|
      t.text :titulo
      t.text :justificativa
      t.text :objetivos
      t.text :metodologia
      t.text :programacao
      t.text :material
      t.text :referencias
      t.references :participante, index: true, foreign_key: true
      t.integer :avaliacao
      t.string :local
      t.integer :vagas

      t.timestamps null: false
    end
  end
end
