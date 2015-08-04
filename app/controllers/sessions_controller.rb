class SessionsController < ApplicationController

  def new
  	render :layout => false
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if !session[:forwarding_url].nil?
        redirect_to session[:forwarding_url]
      else
        redirect_to user
      end
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    session.clear
    @current_user = nil
    flash[:success] = "Bye Bye Tomato!"
    redirect_to tomato_home_url
  end

end
