class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?
  helper_method :destroy


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

  def destroy
    log_out if logged_in?
    flash[:success] = "Bye Bye Tomato!"
    redirect_to login_url
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
