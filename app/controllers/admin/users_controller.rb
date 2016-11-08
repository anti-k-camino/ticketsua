class Admin::UsersController < Admin::BaseController 
  before_action :set_user, except:[:index] 
  after_action :notify, only:[:block, :unblock]
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

  def notify
    Admin::UserMailer.send(action_name.to_sym, @user).send(:deliver_later) unless @user.errors.any?
  end

=begin 
   Admin::UserMailer.block(@user).deliver_later unless @user.errors.any?
=end

  
end
