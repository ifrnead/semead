class UsuarioMailer < ApplicationMailer

  def recuperar_senha(usuario)
    @usuario = usuario
    mail(to: usuario.email, subject: '[SEMEAD] Recuperação de senha')
  end

end
