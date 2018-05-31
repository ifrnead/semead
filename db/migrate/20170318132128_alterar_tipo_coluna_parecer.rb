class AlterarTipoColunaParecer < ActiveRecord::Migration[4.2]
  def change
    change_column :avaliacoes_trabalhos, :parecer, :text
  end
end
