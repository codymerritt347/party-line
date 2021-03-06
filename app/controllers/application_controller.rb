class ApplicationController < ActionController::Base
  add_flash_types :info, :success, :error, :warning
  protect_from_forgery with: :exception
  before_action :require_login

  include SessionsHelper
  include UsersHelper
  include StatusesHelper

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section!"
      redirect_to login_path
    end
  end
end
