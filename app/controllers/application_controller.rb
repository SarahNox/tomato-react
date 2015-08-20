class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  private

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    end
  end

  def logged_in?
    !current_user.nil?
  end
  
  def logged_in_user
  	unless logged_in?
  		store_location
  		flash[:danger] = "Please log in."
  		redirect_to login_url
  	end
  end


end
