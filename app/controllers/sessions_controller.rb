class SessionsController < ApplicationController
  layout 'publico'

  def new
  end

  def create
    usuario = Usuario.autenticar(params[:email], params[:password])
    if usuario.present?
      session[:usuario_id] = usuario.id
      if usuario.tem_perfil?("participante")
        redirect_to participacao_path
      else
        redirect_to admin_path
      end
    else
      redirect_to new_session_path, alert: 'E-mail e/ou senha inválido(s)!'
    end
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to "http://ead.ifrn.edu.br/semead"
  end
end
