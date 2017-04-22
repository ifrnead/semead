class InscricaoMailer < ApplicationMailer

  def realizada(inscricao)
    @inscricao = inscricao
    mail(to: @inscricao.participante.email, subject: '[SEMEAD] Inscrição em minicurso realizada com sucesso!')
  end

  def cancelada(inscricao)
    @inscricao = inscricao
    mail(to: @inscricao.participante.email, subject: '[SEMEAD] Cancelamento de inscrição em minicurso')
  end
end
