class UsersController < ApplicationController
	before_action :logged_in_user, :except =>[:new, :create]
	skip_before_action :verify_authenticity_token
	helper_method :edit_user_params

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
			redirect_to root_url
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
        	@user.update_attributes(edit_user_params)
        	flash[:success] = "Profile updated"
            redirect_to @user
        else
        	flash.now[:error] = "Authentication failed"
            render 'edit'
        end
    end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def edit_user_params
        params.require(:user).permit(:name, :email)
    end

end