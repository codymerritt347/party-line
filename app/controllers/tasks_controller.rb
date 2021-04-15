class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.valid?
      @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    task = Task.find(params[:id])
    if task
      task.destroy
      redirect_to tasks_path, notice: "Task deleted"
    else
      redirect_to tasks_path, notice: "Task not found"
    end
  end

  private

  def task_params
    params.require(:task).permit(
      :title,
      :description,
      :party_id
    )
  end
end
