class CreateParticipantes < ActiveRecord::Migration
  def change
    create_table :participantes do |t|
      t.string :documento
      t.references :tipo_participante, index: true, foreign_key: true
      t.references :cidade, index: true, foreign_key: true
      t.references :pais, index: true, foreign_key: true
      t.string :instituicao
      t.boolean :possui_necessidades_especiais
      t.text :necessidades_especiais
      t.boolean :pago, default: false

      t.timestamps null: false
    end
  end
end
