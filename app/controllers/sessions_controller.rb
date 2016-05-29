class SessionsController < ApplicationController
  def new
  end

  def create
    usuario = Usuario.autenticar(params[:email], params[:password])
    if usuario.present?
      session[:usuario_id] = usuario.id
      redirect_to admin_path, notice: 'Autenticado com sucesso!'
    else
      render 'new'
    end
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to root_path, notice: 'Saiu do sistema.'
  end
end
