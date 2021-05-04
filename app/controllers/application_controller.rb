class ApplicationController < ActionController::Base
  add_flash_types :info, :success, :error, :warning
  protect_from_forgery with: :exception

end
