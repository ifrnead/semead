class CreateOrganizadores < ActiveRecord::Migration
  def change
    create_table :organizadores do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
