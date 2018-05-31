class CreateMembros < ActiveRecord::Migration[4.2]
  def change
    create_table :membros do |t|
      t.references :organizador, index: true, foreign_key: true
      t.references :linha, index: true, foreign_key: true
      t.boolean :coordenador

      t.timestamps null: false
    end
  end
end
