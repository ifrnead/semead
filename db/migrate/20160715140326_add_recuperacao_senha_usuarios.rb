class AddRecuperacaoSenhaUsuarios < ActiveRecord::Migration[4.2]
  def change
    add_column :usuarios, :codigo_recuperar_senha, :string
    add_column :usuarios, :prazo_recuperacao_senha, :datetime
  end
end
