class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= Usuario.find(session[:usuario_id]) if session[:usuario_id]
  end

  def current_user?
    current_user.present?
  end

  helper_method :current_user, :current_user?

  def autenticacao_obrigatoria
    redirect_to root_path, alert: 'Não autorizado!' if current_user?
  end
end
