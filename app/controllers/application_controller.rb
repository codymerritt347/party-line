class ApplicationController < ActionController::Base
  add_flash_types :success, :error, :warning, :info
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end
