class CreateOrganizadores < ActiveRecord::Migration[4.2]
  def change
    create_table :organizadores do |t|

      t.timestamps null: false
    end
  end
end
