class ParticipanteMailer < ApplicationMailer

  def inscricao_realizada(participante)
    @participante = participante
    @url_pagamento = url_pagamento(participante)
    mail(to: participante.email, subject: '[SEMEAD] Inscrição realizada com sucesso!')
  end

end
