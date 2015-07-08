class PomodorosController < ApplicationController
	skip_before_action :verify_authenticity_token

	def create
		p = Pomodoro.new
		p.save
		render text: "Pomodoro saved"
	end
end
