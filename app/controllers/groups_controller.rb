class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
  end

  def create
    @group = Group.new(group_params)
    if @group.valid?
      @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to group_path(@group)
  end

  def destroy
    @group = Group.find(params[:id])
  end

  private
  
  def group_params
    params.require(:group).permit(
      :name
    )
end
