class PomodorosController < ApplicationController
		skip_before_action :verify_authenticity_token

	def index
		@pomodoros = Pomodoro.page(params[:page]).per(20).order("created_at DESC")
		render :layout => false
	end

	def show
        @pomodoros = Pomodoro.all.reverse
		render :layout => false
	end

	def new
		@pomodoro = Pomodoro.new
		render :layout => false
	end

	def save
		p = Pomodoro.new
		p.save
		render text: "Pomodoro saved"
	end

	def create
		p = Pomodoro.new(pomodoro_params)
		p.save
		redirect_to tomato_home_path
	end	

private
    def pomodoro_params
      params.require(:pomodoro).permit(:project, :issue)
    end
end

