class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new(plan_params)
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.save
    redirect_to plan_path(@plan)
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
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
