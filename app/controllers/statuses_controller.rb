class StatusesController < ApplicationController
  before_action :get_user, except: [:show]
  before_action :set_status, only: [:show, :edit, :update, :destroy]
  
  def index
    @statuses = @user.statuses
  end

  def new
    @status = @user.statuses.build
  end

  def create
    @status = @user.statuses.build(status_params)
    if @status.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @status.update(status_params)
      redirect_to user_status_path(@user)
    else
      render :edit
    end
  end

  def destroy
    if @status
      @status.destroy
      redirect_to statuses_path, notice: "Status deleted"
    else
      redirect_to statuses_path, notice: "Status not found"
    end
  end

  private

  def get_user
    @user = User.find(params[:user_id])
  end

  def set_status
    @status = @user.statuses.find(params[:id])
  end

  def status_params
    params.require(:status).permit(
      :user_id,
      :content
    )
  end
end