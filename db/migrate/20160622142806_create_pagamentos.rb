class CreatePagamentos < ActiveRecord::Migration
  def change
    create_table :pagamentos do |t|
      t.references :participante, index: true, foreign_key: true
      t.text :json
      t.date :expira_em
      t.string :mercado_pago_id
      t.text :init_point
      t.text :sandbox_init_point

      t.timestamps null: false
    end
  end
end
