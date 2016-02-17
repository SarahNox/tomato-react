class TasksController < ApplicationController
  def new
    @task = Task.new
    @project = Project.find(params[:project_id])
  end

  def create
    t = Task.new(task_params)
    t.user = current_user
    t.project = Project.find(params[:project_id])
    t.save
    redirect_to root_url
  end

  private
  def task_params
    params.require(:task).permit(:name)
  end
end
