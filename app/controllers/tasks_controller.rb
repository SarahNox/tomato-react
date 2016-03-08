class TasksController < ApplicationController
  def new
    @task = Task.new
    @project = Project.find(params[:project_id])
    @pomodoro = Pomodoro.new
    @pomodoros = Pomodoro.daily_pomodoros(current_user)
    @projects = current_user.projects
    @tasks = current_user.tasks
  end

  def create
    t = Task.new(task_params)
    t.user = current_user
    t.project = Project.find(params[:project_id])
    t.save
    redirect_to new_project_task_pomodoro_url(t.project.id, t.id)
  end

  private
  def task_params
    params.require(:task).permit(:name)
  end
end
