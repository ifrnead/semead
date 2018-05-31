class CreateUsuarios < ActiveRecord::Migration[4.2]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :email
      t.string :password_digest
      t.integer :autenticavel_id
      t.string :autenticavel_type
      t.references :perfil, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :usuarios, :autenticavel_id
  end
end
