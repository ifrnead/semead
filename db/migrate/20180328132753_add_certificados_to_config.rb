class AddCertificadosToConfig < ActiveRecord::Migration
  def change
    add_column :configs, :exibir_certificados, :boolean
  end
end
