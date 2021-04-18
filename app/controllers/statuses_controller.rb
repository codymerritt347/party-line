class StatusesController < ApplicationController
  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    if @status.valid?
      @status.user = User.find(params[:id])
      @status.save
      redirect_to status_path(@status)
    else
      render :new
    end
  end

  def show
    @status = Status.find(params[:id])
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    @status.update(status_params)
    redirect_to status_path(@status)
  end

  def destroy
    status = Status.find(params[:id])
    if status
      status.destroy
      redirect_to statuses_path, notice: "Status deleted"
    else
      redirect_to statuses_path, notice: "Status not found"
    end
  end

  private

  def status_params
    params.require(:status).permit(
      :user_id,
      :content
    )
  end
end