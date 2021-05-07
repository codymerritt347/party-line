class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[ home new create omniauth ]

  def home
  end

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      helpers.log_in(@user)
      redirect_to @user
    else
      flash[:error] =  "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def omniauth
    @user = User.create_from_omniauth(auth)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to root_path
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end