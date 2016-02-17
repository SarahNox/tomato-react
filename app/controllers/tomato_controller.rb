class TomatoController < ApplicationController

	def home
		if !logged_in?
			destroy
		else 
      @projects = current_user.projects
      @tasks = current_user.tasks
			@pomodoro = Pomodoro.new
			@pomodoros = Pomodoro.daily_pomodoros(current_user)
		end
	end

	def show
		@pomodoros = Pomodoro.all
	end
  
end
