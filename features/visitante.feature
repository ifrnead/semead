# language: pt

@javascript
Funcionalidade: Inscrição de participante
  Como um visitante
  Eu quero realizar minha inscrição
  De modo eu possa participar do evento

  Cenário: Inscrição bem sucedida
    Dado que um visitante acesse a página de inscrição do evento
    Quando o visitante preencher o formulário de inscrição
    E submeter o formulário de inscrição
    Então deve ver a mensagem "Inscrição realizada com sucesso!"

  Cenário: Inscrição mal sucedida
    Dado que um visitante acesse a página de inscrição do evento
    Quando o visitante não preencher o endereço de e-mail
    E submeter o formulário de inscrição
    Então deve ver a mensagem "endereço de e-mail inválido"
