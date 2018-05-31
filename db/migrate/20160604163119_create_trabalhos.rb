class CreateTrabalhos < ActiveRecord::Migration[4.2]
  def change
    create_table :trabalhos do |t|
      t.text :titulo
      t.text :resumo
      t.references :linha, index: true, foreign_key: true
      t.references :participante, index: true, foreign_key: true
      t.references :tipo_trabalho, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
