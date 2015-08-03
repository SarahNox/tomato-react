class PomodorosController < ApplicationController
	    before_filter :authenticate_user!
		skip_before_action :verify_authenticity_token

	def index
		@pomodoros = Pomodoro.where("created_at >= ?", Time.zone.now.beginning_of_day).page(1).per(16)
		render :layout => false
	end

	def history
        @pomodoros = Pomodoro.page(params[:page]).per(20).order("created_at DESC")
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
		p.user = current_user
		p.save
		redirect_to tomato_home_path
	end	

private
    def pomodoro_params
      params.require(:pomodoro).permit(:project, :issue)
    end
end

