class PasswordResetsController < ApplicationController

  helper_method :change_password_params
  before_action :logged_in_user, :except =>[:new, :create]

  def new
    @user = User.new
  end

  def edit
  end

end
