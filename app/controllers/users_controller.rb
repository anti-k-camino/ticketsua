class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    respond_with @users = User.all
  end
end
