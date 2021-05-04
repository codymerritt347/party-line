class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :require_login, only: [:new, :create]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.statuses.build
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
    @status = Status.new
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.valid?
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user
      @user.destroy
      redirect_to '/'
    else
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :screen_name,
      :email,
      :password,
      :password_confirmation,
      statuses_attributes: [
        :user_id,
        :content
      ],
      party_ids: []
    )
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end

end