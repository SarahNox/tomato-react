class UsersController < ApplicationController
	def index
		@users = User.page(params[:page]).per(20).order("created_at DESC")

	end

	def new
		@user = User.new
	end

	def show
		@users = User.all
	end

	def create
		@user = User.new(user_params)   
		if @user.save
			redirect_to @user
		else
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email)
	end

end
