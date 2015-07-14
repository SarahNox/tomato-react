class TomatoController < ApplicationController

  def home	
  end

  def show
  	@pomodoros = Pomodoro.all
  	render :layout => false
  end

end
