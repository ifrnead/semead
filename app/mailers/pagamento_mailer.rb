class PagamentoMailer < ApplicationMailer

  def aprovado(participante)
    @participante = participante
    mail(to: participante.email, subject: '[SEMEAD] Pagamento da taxa de inscrição confirmado!')
  end

  def em_processamento(participante)
    @participante = participante
    mail(to: participante.email, subject: '[SEMEAD] Pagamento da taxa de inscrição em processamento')
  end

  def em_mediacao(participante)
    @participante = participante
    mail(to: participante.email, subject: '[SEMEAD] Pagamento da taxa de inscrição em mediação')
  end

  def pendente(participante)
    @participante = participante
    @url_pagamento = url_pagamento(participante)
    mail(to: participante.email, subject: '[SEMEAD] Pagamento da taxa de inscrição pendente')
  end

  def rejeitado(participante)
    @participante = participante
    @url_pagamento = url_pagamento(participante)
    mail(to: participante.email, subject: '[SEMEAD] Pagamento da taxa de inscrição rejeitado')
  end

  def cancelado(participante)
    @participante = participante
    @url_pagamento = url_pagamento(participante)
    mail(to: participante.email, subject: '[SEMEAD] Pagamento da taxa de inscrição cancelado')
  end

  def devolvido(participante)
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
