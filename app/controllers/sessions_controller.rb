class SessionsController < ApplicationController
  def new
  	render :layout => false
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      render 'new'
    end
  end

  def destroy
    session.clear
    flash[:success] = "Bye Bye Tomato!"
    redirect_to tomato_home_url
  end

end
