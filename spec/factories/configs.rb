FactoryBot.define do
  factory :config do
    dev true
    data_abertura_inscricoes Date.new(2018, 3, 1)
    data_encerramento_inscricoes Date.new(2018, 12, 31)
    data_inicio_submissao_trabalhos Date.new(2018, 3, 1)
    data_termino_submissao_trabalhos Date.new(2018, 12, 31)
    data_inicio_submissao_minicursos Date.new(2018, 3, 1)
    data_termino_submissao_minicursos Date.new(2018, 12, 31)
    data_inicio_inscricoes_minicursos Date.new(2018, 3, 1)
    data_termino_inscricoes_minicursos Date.new(2018, 12, 31)
    prazo_redefinir_senha 1 # dia
    prazo_pagamento 5 # dias
    quantidade_maxima_inscricoes_minicursos 1 # minicurso
  end
end
