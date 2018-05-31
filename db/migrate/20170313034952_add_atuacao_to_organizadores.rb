class AddAtuacaoToOrganizadores < ActiveRecord::Migration[4.2]
  def change
    add_column :organizadores, :atuacao, :string 
  end
end
