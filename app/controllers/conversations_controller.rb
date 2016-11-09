
class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, only:[:create]

  respond_to :js

  def index
   @users = User.all
   @conversations = Conversation.all
  end

  def messages
    @conversation = Conversation.where('receiver_id = ?', conversation_params[:receiver_id])
    respond_with @conversations = current_user.conversations
  end


  def create
    redirect_to conversation_messages_path(@conversation)
  end

  private
  def conversation_params
    params.permit(:sender_id, :receiver_id)
  end

  def set_conversation
    if Conversation.between(params[:sender_id],params[:receiver_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
  end
end
