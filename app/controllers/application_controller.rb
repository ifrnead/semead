class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to login_path, :alert => "Não autorizado!"
  end

  private

  def current_user
    @current_user = Usuario.find(session[:usuario_id]) if session[:usuario_id]
  end

  def current_user?
    current_user.present?
  end

  helper_method :current_user, :current_user?
end
