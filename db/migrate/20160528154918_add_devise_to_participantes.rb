class AddDeviseToParticipantes < ActiveRecord::Migration
  def self.up
    change_table :participantes do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
    end

    add_index :participantes, :email,                unique: true
    add_index :participantes, :reset_password_token, unique: true
    add_index :participantes, :confirmation_token,   unique: true
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
