class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :require_login, only: %i[ new create ]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.build_status
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, success: "User successfully created!"
    else
      flash.now[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @user.build_status
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to root_path
    else
      redirect_to @user
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      statuses_attributes: [
        :user_id,
        :content
      ]
    )
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end

end