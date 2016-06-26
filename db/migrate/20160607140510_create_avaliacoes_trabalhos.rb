class CreateAvaliacoesTrabalhos < ActiveRecord::Migration
  def change
    create_table :avaliacoes_trabalhos do |t|
      t.integer :situacao
      t.boolean :atende_normas
      t.boolean :tematica_evento
      t.integer :tematica_linha
      t.integer :relevancia
      t.integer :adequacao
      t.integer :consistencia
      t.integer :interlocucao
      t.integer :originalidade
      t.string :parecer
      t.references :linha, index: true, foreign_key: true
      t.references :trabalho, index: true, foreign_key: true
      t.references :organizador, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
