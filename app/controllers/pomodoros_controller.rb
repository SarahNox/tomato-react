class PomodorosController < ApplicationController
	before_filter :logged_in_user
	skip_before_action :verify_authenticity_token, :only => :create

	def index
		@pomodoros = Pomodoro.daily_pomodoros(current_user)
    @projects = current_user.projects
    @tasks = current_user.tasks
	end

	def history
		@pomodoros = current_user.pomodoros.page(params[:page]).per(10).order("created_at DESC")	
	end

	def new
		@pomodoro = Pomodoro.new
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @pomodoros = Pomodoro.daily_pomodoros(current_user)
    @projects = current_user.projects
    @tasks = current_user.tasks
	end

	def create 
    p = Pomodoro.new(pomodoro_params)
		p.user = current_user
    p.task = Task.find(params[:task_id])
    p.project = Project.find(params[:project_id])
		p.save
    if p.success?
      redirect_to project_task_pomodoros_url
    else
      redirect_to pomodoros_spoiled_url
    end
	end

  def spoiled
    @pomodoro = Pomodoro.new
    @pomodoros = Pomodoro.daily_pomodoros(current_user)
    @projects = current_user.projects
    @tasks = current_user.tasks
  end

	private
	def pomodoro_params
		params.require(:pomodoro).permit(:project, :task, :success)
	end

end

