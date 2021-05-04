class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:home, :new, :create]

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
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_url
  end
end