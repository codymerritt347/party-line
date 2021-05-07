class StatusesController < ApplicationController
  before_action :set_status, only: %i[ edit update destroy ]
  before_action :set_user, only: %i[ index new create  ]
  
  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end

  def create
    @status = @user.build_status(status_params)
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
      redirect_to user_statuses_path(@user)
    else
      render :edit
    end
  end

  def destroy
    if @status.destroy
      redirect_to user_statuses_path(@user), success: "Status deleted"
    else
      redirect_to user_statuses_path(@user), error: "Status not found"
    end
  end

  private

  def set_status
    @status = Status.find_by_id(params[:id])
  end

  def status_params
    params.require(:status).permit(
      :user_id,
      :content
    )
  end

  def set_user
    @user = User.find_by_id(params[:user_id])
  end
end