class AddRecuperacaoSenhaUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :codigo_recuperar_senha, :string
    add_column :usuarios, :prazo_recuperacao_senha, :datetime
  end
end
