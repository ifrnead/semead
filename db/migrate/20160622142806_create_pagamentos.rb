class CreatePagamentos < ActiveRecord::Migration[4.2]
  def change
    create_table :pagamentos do |t|
      t.references :participante, index: true, foreign_key: true
      t.text :mp_preference
      t.text :mp_payment
      t.string :mp_id
      t.text :mp_merchant_order
      t.text :mp_init_point
      t.date :prazo
      t.float :valor
      t.string :situacao

      t.timestamps null: false
    end
  end
end
