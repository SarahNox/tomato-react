class PomodorosController < ApplicationController
	before_filter :logged_in_user
	skip_before_action :verify_authenticity_token, :only => :create

	def index
		@pomodoros = Pomodoro.daily_pomodoros(current_user)
	end

	def history
		@pomodoros = current_user.pomodoros.page(params[:page]).per(10).order("created_at DESC")	
	end

	def new
		@pomodoro = Pomodoro.new
	end

	def save
		p = Pomodoro.new
		p.save
		render text: "Pomodoro saved"
	end

	def create
		p = Pomodoro.new(project_params)
		p.user = current_user
		p.save
		redirect_to root_url
	end

	private
	def pomodoro_params
		params.require(:pomodoro).permit(:project, :task)
	end

  def project_params
    params.permit(:project)
  end

  def task_params
    params.permit(:task)
  end
end

