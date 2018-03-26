FactoryBot.define do
  factory :config do
    dev false
    data_abertura_inscricoes "2018-03-26"
    data_encerramento_inscricoes "2018-03-26"
    data_inicio_submissao_trabalhos "2018-03-26"
    data_termino_submissao_trabalhos "2018-03-26"
    data_inicio_submissao_minicursos "2018-03-26"
    data_termino_submissao_minicursos "2018-03-26"
    data_inicio_inscricoes_minicursos "2018-03-26"
    data_termino_inscricoes_minicursos "2018-03-26"
    prazo_redefinir_senha 1
    prazo_pagamento 1
    quantidade_maxima_inscricoes_minicursos 1
    url_questionario_avaliacao "MyText"
    key_planilha_formulario_avaliacao "MyText"
  end
end
