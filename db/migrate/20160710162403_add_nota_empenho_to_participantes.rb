class AddNotaEmpenhoToParticipantes < ActiveRecord::Migration[4.2]
  def change
    add_column :participantes, :pagamento_por_empenho, :boolean, { default: false }
    add_attachment :participantes, :nota_empenho
  end
end
