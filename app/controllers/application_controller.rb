class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def tomato
    render text: "Sarah is trying to code a tomato-clock!"
   #  tomato = Time.now  
   #  puts tomato.strftime("%H:%M:%S") 
  end

end
