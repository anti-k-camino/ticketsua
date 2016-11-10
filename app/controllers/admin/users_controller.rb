class Admin::UsersController < Admin::BaseController 
  before_action :set_user, except:[:index, :new, :create] 
  after_action :notify, only:[:block, :unblock]
  respond_to :js
  
  def index
    respond_with @users = User.where('admin = ?', false)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.merge(created_at: DateTime.now))
    @user.skip_confirmation!
    @user.save!
    respond_with @user, location: -> { admin_users_path }   
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
  
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end  
end
