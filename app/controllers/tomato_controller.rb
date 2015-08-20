class TomatoController < ApplicationController

  def home	
  end

  def show
  	@pomodoros = Pomodoro.all
  end

end
