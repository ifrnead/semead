class UsuariosController < ApplicationController
  load_and_authorize_resource :only => :conta

  def conta
    @usuario = current_user
  end

  def atualizar
    @usuario = current_user
    if @usuario.update_attributes(usuario_params)
      redirect_to admin_path, notice: 'Conta atualizada com sucesso!'
    else
      render :conta
    end
  end

  def recuperar_senha
    render 'recuperar_senha', layout: 'publico'
  end

  def recuperacao_senha
    usuario = Usuario.find_by_email(params[:email])
    if usuario.present?
      usuario.gerar_codigo_recuperacao_senha
      render 'recuperacao_senha', layout: 'publico'
    else
      redirect_to recuperar_senha_path, alert: 'Nenhuma conta foi localizada com esse endereço de e-mail.'
    end
  end

  def redefinir_senha
    @usuario = Usuario.where(codigo_recuperar_senha: params[:codigo], email: params[:email]).first
    if @usuario.present?
      if DateTime.now < @usuario.prazo_recuperacao_senha
        render 'redefinir_senha', layout: 'publico'
      else
        redirect_to recuperar_senha_path, alert: 'O código de recuperação de senha não é mais válido! Por favor solicite outro.'
      end
    else
      redirect_to recuperar_senha_path, alert: 'Código de recuperação/email não conferem!'
    end
  end

  def atualizar_senha
    @usuario = Usuario.where(codigo_recuperar_senha: params[:codigo], email: params[:email]).first
    if @usuario.present?
      if @usuario.update_attributes(password: params[:password])
        redirect_to login_path, notice: 'Senha atualizada com sucesso!'
      else
        render 'redefinir_senha'
      end
    else
      redirect_to recuperar_senha_path, alert: 'Código de recuperação/email não conferem!'
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(:nome, :password, :password_confirmation, :email)
  end

end
