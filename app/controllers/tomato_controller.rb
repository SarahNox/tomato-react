class TomatoController < ApplicationController

	def home
		if !logged_in?
			destroy
		else 
			@pomodoro = Pomodoro.new
			@pomodoros = Pomodoro.daily_pomodoros(current_user)
		end
	end

	def show
		@pomodoros = Pomodoro.all
	end

end
