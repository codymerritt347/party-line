class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.parties.build(name: 'First Party')
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render :find_friends
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.valid?
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    if user
      user.destroy
      redirect_to users_path, notice: "User deleted"
    else
      redirect_to users_path, notice: "User not found"
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      parties_attributes: [
        :name
      ]
    )
  end
end