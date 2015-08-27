class TomatoController < ApplicationController

  def home	
  	@pomodoro = Pomodoro.new
  	@pomodoros = Pomodoro.daily_pomodoros(current_user)
  end

  def show
  	@pomodoros = Pomodoro.all
  end

end
