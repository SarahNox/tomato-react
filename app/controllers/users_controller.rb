class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token
	def index
		@users = User.page(params[:page]).per(20).order("created_at DESC")
	end

	def new
		@user = User.new
		render :layout => false
	end

	def show
		@user = User.find(params[:id])
		render :layout => false
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
