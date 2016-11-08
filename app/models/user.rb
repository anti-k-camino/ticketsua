class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  #default_scope { order('updated_at DESC') }
  has_many :conversations, :foreign_key => :receiver_id
  has_many :conversations, :foreign_key => :sender_id

  validates :name, presence: true
  validates :name, uniqueness: true

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end  
end
