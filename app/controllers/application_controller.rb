class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :notify

  rescue_from CanCan::AccessDenied do |exception|
    if Rails.env.development?
      Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
    end
    redirect_to login_path, :alert => "Não autorizado!"
  end

  def test_exception_notification
    raise 'Testando Exception Notification...'
  end

  private

  def notify
    if flash.alert.present?
      @notify_icon = 'fa fa-exclamation-triangle'
      @notify_title = 'Erro'
      @notify_message = alert
      @notify_type = 'danger'
    end
    if flash.notice.present?
      @notify_icon = 'fa fa-info'
      @notify_title = 'Info'
      @notify_message = notice
      @notify_type = 'info'
    end
  end

  def auth_required
    raise CanCan::AccessDenied unless current_user?
  end

  def current_user
    @current_user = Usuario.find(session[:usuario_id]) if session[:usuario_id]
  end

  def current_user?
    current_user.present?
  end

  helper_method :current_user, :current_user?
end
