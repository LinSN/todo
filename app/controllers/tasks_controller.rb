class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    Task.create(task_params)
    redirect_to tasks_path
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    flash[:notice] = "Task was edited"
    redirect_to task_path(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Task was destroyed"
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :priority)
  end

end
