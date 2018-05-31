class AddArquivoToTrabalhos < ActiveRecord::Migration[4.2]
  def up
    add_attachment :trabalhos, :arquivo
  end

  def down
    remove_attachment :trabalhos, :arquivo
  end
end
