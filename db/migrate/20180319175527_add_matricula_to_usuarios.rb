class AddMatriculaToUsuarios < ActiveRecord::Migration[4.2]
  def change
    add_column :usuarios, :matricula, :string
  end
end
