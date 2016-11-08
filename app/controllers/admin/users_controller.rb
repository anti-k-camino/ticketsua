class Admin::UsersController < Admin::BaseController 
  before_action :set_user, except:[:index] 
  respond_to :js
  
  def index
    respond_with @users = User.where('admin = ?', false)
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
