class CreateAvaliacoes < ActiveRecord::Migration
  def change
    create_table :avaliacoes do |t|
      t.integer :situacao
      t.references :trabalho, index: true, foreign_key: true
      t.references :organizador, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
