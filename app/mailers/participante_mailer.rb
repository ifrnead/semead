class ParticipanteMailer < ApplicationMailer

  def inscricao_realizada(participante)
    @participante = participante
    @url_pagamento = url_pagamento(participante)
    mail(to: participante.email, subject: '[SEMEAD] Inscrição realizada com sucesso!')
  end

  def trabalho_submetido(participante, trabalho)
    @participante = participante
    @trabalho = trabalho
    mail(to: participante.email, subject: '[SEMEAD] Trabalho submetido com sucesso!')
  end

  def minicurso_proposto(participante, minicurso)
    @participante = participante
    @minicurso = minicurso
    mail(to: participante.email, subject: '[SEMEAD] Minicurso proposto com sucesso!')
  end

end
