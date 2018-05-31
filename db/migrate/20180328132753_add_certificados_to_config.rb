class AddCertificadosToConfig < ActiveRecord::Migration[4.2]
  def change
    add_column :configs, :exibir_certificados, :boolean
  end
end
