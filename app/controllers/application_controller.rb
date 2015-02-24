class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def display_time 
    @display.clear do 
      title "%02d:%02d:%02d" % [ 
        @seconds / (60*60), 
        @seconds / 60 % 60, 
        @seconds % 60 
      ], :stroke => @paused ? gray : black 
    end 
  end 

  @display = stack :margin => 10 
  display_time 

  button "Pause", :width => '50%' do 
    @paused = !@paused 
    display_time 
  end 
   
  button "Reset", :width => '50%' do 
    @seconds = 0 
    display_time 
  end 

  animate(1) do 
    @seconds += 1 unless @paused 
    display_time 
  end 
end 

  def tomato
  	render text: "Sarah is trying to code a tomato-clock!"
  end
