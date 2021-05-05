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

  def github
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
    else
      flash[:error]='There was a problem signing you in through Github. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
 end

  def destroy
    session.clear
    redirect_to root_url
  end
end