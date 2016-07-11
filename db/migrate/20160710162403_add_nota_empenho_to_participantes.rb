class AddNotaEmpenhoToParticipantes < ActiveRecord::Migration
  def change
    add_column :participantes, :pagamento_por_empenho, :boolean, { default: false }
    add_attachment :participantes, :nota_empenho
  end
end
