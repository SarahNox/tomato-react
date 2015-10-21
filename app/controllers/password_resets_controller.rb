class PasswordResetsController < ApplicationController
	helper_method :change_password_params


  def new
  	@user = User.new
  end

  # def edit
  # 	@user = User.find(params[:id])
  #      if @user.update_attributes(change_password_params)
  #       	flash[:success] = "Profile updated"
  #           redirect_to @user
  #       else
  #           render 'edit'
  #       end
  # end

  # private
  #   def change_password_params
  #       params.require(:user).permit(:current_password, :password, :password_confirmation)
  #   end
end
