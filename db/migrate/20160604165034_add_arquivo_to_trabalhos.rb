class AddArquivoToTrabalhos < ActiveRecord::Migration
  def up
    add_attachment :trabalhos, :arquivo
  end

  def down
    remove_attachment :trabalhos, :arquivo
  end
end
