# Preview all emails at http://localhost:3000/rails/mailers/avaliacao_mailer
class AvaliacaoMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/avaliacao_mailer/avaliacao_atribuida
  def avaliacao_atribuida
    AvaliacaoMailer.avaliacao_atribuida
  end

  # Preview this email at http://localhost:3000/rails/mailers/avaliacao_mailer/avaliacao_conflitante
  def avaliacao_conflitante
    AvaliacaoMailer.avaliacao_conflitante
  end

end
