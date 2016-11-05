class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only:[:show, :block, :unblock]

  respond_to :js
  def index
    respond_with @users = User.all
  end

  def show
  end

  def block
    @user.update(blocked: true)
    respond_with @user
  end

  def unblock
    @user.update(blocked: false)
    respond_with @user
  end

  protected
  def set_user
    @user = User.find(params[:id])
  end
end
