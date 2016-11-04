class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only:[:show]
  def index
    respond_with @users = User.all
  end

  def show
  end

  protected
  def set_user
    @user = User.find(params[:id])
  end
end
