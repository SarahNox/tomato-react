class PomodorosController < ApplicationController
	skip_before_action :verify_authenticity_token

	def create
		p = Pomodoro.new
		p.save
		render text: "Pomodoro saved"
	end

	def index
		@pomodoros = Pomodoro.last(10)
	end

	def show
		@pomodoro = Pomodoro.find(params[:id])
	end

end
