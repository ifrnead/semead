class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def participante_autenticado
    @participante_autenticado ||= Participante.find(session[:participante_id]) if session[:participante_id]
  end

  helper_method :participante_autenticado

  def autenticacao_participante_obrigatoria
    redirect_to root_path, alert: 'Não autorizado!' if participante_autenticado.nil?
  end
end
