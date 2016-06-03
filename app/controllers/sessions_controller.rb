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
      flash.alert = 'E-mail e/ou senha inválido(s)!'
      render 'new'
    end
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to root_path, notice: 'Saiu do sistema.'
  end
end
