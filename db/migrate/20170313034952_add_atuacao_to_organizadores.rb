class AddAtuacaoToOrganizadores < ActiveRecord::Migration
  def change
    add_column :organizadores, :atuacao, :string 
  end
end
