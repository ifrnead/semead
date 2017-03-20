# language: pt

@javascript
Funcionalidade: Inscrição de participante
  Como um visitante
  Eu quero realizar minha inscrição
  De modo eu possa participar do evento

  Contexto:
    Dado que um visitante acesse a página de inscrição do evento
    Quando o visitante preencher o formulário de inscrição

  Cenário: Inscrição com pagamento da taxa de inscrição tradicional
    E submeter o formulário de inscrição
    Então deve ver a mensagem "Inscrição realizada com sucesso!"
    Então deve receber um email com o assunto "[SEMEAD] Inscrição realizada com sucesso!"
    Então deve receber um email com o conteúdo "A sua inscrição para a III SEMEAD foi realizada com sucesso! Contudo, ainda será preciso confirmá-la através do pagamento da sua taxa de inscrição."

  Cenário: Inscrição com pagamento por nota de empenho
    E selecionar pagamento por nota de empenho
    E submeter o formulário de inscrição
    Então deve ver a mensagem "Inscrição realizada com sucesso!"
    Então deve receber um email com o assunto "[SEMEAD] Inscrição realizada com sucesso!"
    Então deve receber um email com o conteúdo "A sua inscrição para a III SEMEAD foi realizada com sucesso! Contudo, ainda será preciso confirmá-la através da verificação da sua nota de empenho para o pagamento da taxa de inscrição."

  Cenário: Inscrição com isenção da taxa de inscrição
    E solicitar a isenção da taxa de inscrição por ser "Organizador"
    E submeter o formulário de inscrição
    Então deve ver a mensagem "Inscrição realizada com sucesso!"
    Então deve receber um email com o assunto "[SEMEAD] Inscrição realizada com sucesso!"
    Então deve receber um email com o conteúdo "A sua inscrição para a III SEMEAD foi realizada com sucesso! Contudo, ainda será preciso confirmá-la através da conferência da sua isenção da taxa de inscrição."
