class ApplicationController < ActionController::Base
  add_flash_types :success, :error, :warning, :info
  protect_from_forgery with: :exception

end
