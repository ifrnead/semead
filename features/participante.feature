# language: pt
@javascript

Funcionalidade: Inscrição de participante

  Cenário: Inscrição bem sucedida
    Dado que um visitante acesse a página de inscrição do evento
    Quando o visitante preencher os campos do formulário de inscrição do evento
    # Quando o visitante selecionar 'Natal' no select2 'Cidade'
    E clicar em "Enviar"
    Então deve ver a mensagem "Inscrição realizada com sucesso!"
