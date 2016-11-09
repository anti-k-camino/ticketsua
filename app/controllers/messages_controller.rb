class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, except:[:open]
  before_action :set_message, only:[:open]

  respond_to :js

  def index 
    @author = User.find(@conversation.receiver_id)   
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    respond_with @message = @conversation.messages.create(message_params.merge(user_id: current_user.id))
  end

  
  def open
    @message.open!
    respond_with @message
  end

  private
 
  def set_message
    @message = Message.find(params[:id])
  end

  def set_conversation
    @conversation = Conversation.includes(:messages).find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end