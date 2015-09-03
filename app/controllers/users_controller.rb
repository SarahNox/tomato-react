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
		# @pomodoros = Pomodoro.page(params[:page]).per(10).order("created_at DESC")
	end

	def create
		@user = User.new(user_params)   
		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "Welcome to the Pomodoro-Clock!"
			redirect_to root_url
		else
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
