class ParticipanteMailer < ApplicationMailer

  def inscricao_realizada(participante)
    @participante = participante
    @url_pagamento = url_pagamento(participante)
    mail(to: participante.email, subject: '[SEMEAD] Inscrição realizada com sucesso!')
  end

  def pagamento_aprovado(participante)
    @participante = participante
    mail(to: participante.email, subject: '[SEMEAD] Pagamento da taxa de inscrição confirmado!')
  end

  def pagamento_em_processamento(participante)
    @participante = participante
    mail(to: participante.email, subject: '[SEMEAD] Pagamento da taxa de inscrição em processamento')
  end

  def pagamento_pendente(participante)
    @participante = participante
    @url_pagamento = url_pagamento(participante)
    mail(to: participante.email, subject: '[SEMEAD] Pagamento da taxa de inscrição pendente')
  end

  def pagamento_rejeitado(participante)
    @participante = participante
    @url_pagamento = url_pagamento(participante)
    mail(to: participante.email, subject: '[SEMEAD] Pagamento da taxa de inscrição rejeitado')
  end

  def pagamento_cancelado(participante)
    @participante = participante
    @url_pagamento = url_pagamento(participante)
    mail(to: participante.email, subject: '[SEMEAD] Pagamento da taxa de inscrição cancelado')
  end

  def pagamento_devolvido(participante)
    @participante = participante
    @url_pagamento = url_pagamento(participante)
    mail(to: participante.email, subject: '[SEMEAD] Pagamento da taxa de inscrição devolvido')
  end

  private

  def url_pagamento(participante)
    if Rails.env.development?
      return "http://localhost:3000/participantes/#{participante.id}/pagar"
    else
      return "http://eventos.ifrn.edu.br/semead/participantes/#{participante.id}/pagar"
    end
  end

end
