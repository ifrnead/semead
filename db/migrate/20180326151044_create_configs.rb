class CreateConfigs < ActiveRecord::Migration[4.2]
  def change
    create_table :configs do |t|
      t.boolean :dev
      t.date :data_abertura_inscricoes
      t.date :data_encerramento_inscricoes
      t.date :data_inicio_submissao_trabalhos
      t.date :data_termino_submissao_trabalhos
      t.date :data_inicio_submissao_minicursos
      t.date :data_termino_submissao_minicursos
      t.date :data_inicio_inscricoes_minicursos
      t.date :data_termino_inscricoes_minicursos
      t.integer :prazo_redefinir_senha
      t.integer :prazo_pagamento
      t.integer :quantidade_maxima_inscricoes_minicursos
      t.text :url_questionario_avaliacao
      t.text :key_planilha_formulario_avaliacao

      t.timestamps null: false
    end
  end
end
