class PomodorosController < ApplicationController
	    before_filter :logged_in_user
		skip_before_action :verify_authenticity_token, :only => :create

	def index
		@pomodoros = current_user.pomodoros.where("created_at >= ?", Time.zone.now.beginning_of_day).page(1).per(16)
		render :layout => false
	end

	def history
        @pomodoros = current_user.pomodoros.page(params[:page]).per(20).order("created_at DESC")
		
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

