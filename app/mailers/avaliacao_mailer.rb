class AvaliacaoMailer < ApplicationMailer

  def avaliacao_atribuida(avaliador, trabalho)
    @avaliador = avaliador
    @trabalho = trabalho

    if Rails.env.development?
      @download = "http://localhost:3000" + @trabalho.download
    else
      @download = "http://eventos.ifrn.edu.br" + @trabalho.download
    end

    mail to: avaliador.email, subject: '[SEMEAD] Avaliação atribuída para você'
  end

  def trabalho_aprovado(trabalho)
    @trabalho = trabalho

    mail to: trabalho.participante.email, subject: '[SEMEAD] Trabalho aprovado!'
  end

  def trabalho_reprovado(trabalho)
    @trabalho = trabalho

    mail to: trabalho.participante.email, subject: '[SEMEAD] Avaliação do seu trabalho'
  end

  def minicurso_aprovado(minicurso)
    @minicurso = minicurso

    mail to: minicurso.participante.email, subject: '[SEMEAD] Sua proposta de minicurso foi aprovada!'
  end

  def minicurso_reprovado(minicurso)
    @minicurso = minicurso

    mail to: minicurso.participante.email, subject: '[SEMEAD] Avaliação da sua proposta de minicurso'
  end

end
