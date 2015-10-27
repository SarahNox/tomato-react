class PasswordResetsController < ApplicationController
  before_action :logged_in_user, :except =>[:new, :create]

  def new
    @user = User.new
  end

  def edit
  end

end
