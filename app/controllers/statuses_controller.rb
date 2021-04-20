class StatusesController < ApplicationController
  before_action :set_status, only: %i[ show edit update destroy ]
  
  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    if @status.valid?
      @status.save
      redirect_to @status
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @status.update(status_params)
    redirect_to @status
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

  def set_status
    @status = Status.find_by_id(params[:id])
  end

  def status_params
    params.require(:status).permit(
      :user_id,
      :content
    )
  end
end