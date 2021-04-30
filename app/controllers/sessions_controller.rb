class SessionsController < ApplicationController
  def home
  end

  def new
  end

  def create
    def create
      @user = User.find_or_create_from_auth_hash(auth_hash)
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged Out!"
  end

  def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to home_path
  end

  private
  
  def auth_hash
    request.env['omniauth.auth']
  end
end