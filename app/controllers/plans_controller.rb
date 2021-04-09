class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.valid?
      @plan.save
      redirect_to plan_path(@plan)
    else
      render :new
    end
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
  end

  def update
    @plan = Plan.find(params[:id])
    @plan.update(plan_params)
    redirect_to plan_path(@plan)
  end

  def destroy
    @plan = Plan.find(params[:id])
  end

  private

  def plan_params
    params.require(:plan).permit(
      :title,
      :description
    )
  end
end
