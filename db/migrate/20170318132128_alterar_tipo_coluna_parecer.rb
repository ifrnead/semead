class AlterarTipoColunaParecer < ActiveRecord::Migration
  def change
    change_column :avaliacoes_trabalhos, :parecer, :text
  end
end
