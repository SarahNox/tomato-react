class UsersController < ApplicationController
  before_action :logged_in_user, :except =>[:new, :create]
  skip_before_action :verify_authenticity_token

  def index
    @users = User.page(params[:page]).per(20).order("created_at DESC")
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @pomodoros = current_user.pomodoros.page(params[:page]).per(10).order("created_at DESC")
  end

  def create
    @user = User.new(user_params)   
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Pomodoro-Clock!"
      redirect_to new_project_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.authenticate(user_params[:password]) 
      if @user.update_attributes(edit_user_params)
        flash[:success] = "Profile updated"
        redirect_to @user
      else 
        render 'edit'
      end
    else
      flash.now[:danger] = "Authentication failed"
      render 'edit'
    end
  end

  def update_password
    @user = User.find(params[:id])
    if @user.authenticate(change_password_params[:current_password])
      @user.password = change_password_params[:new_password]
      @user.password_confirmation = change_password_params[:new_password_confirmation]
      if @user.save 
        flash[:success] = "Profile updated"
        redirect_to @user
      else 
        render 'edit_password'
      end
    else
      flash.now[:danger] = "Authentication failed"
      render 'edit_password'
    end
  end

  def edit_password
    @user = User.find(params[:id])
  end

  private

  def edit_user_params
    params.require(:user).permit(:name, :email)
  end

  def change_password_params
    params.permit(:current_password, :new_password, :new_password_confirmation)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end