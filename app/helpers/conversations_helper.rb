module ConversationsHelper

  def get_addresser(conversation)
    if conversation.sender_id == current_user.id || conversation.receiver_id == current_user.id
      if conversation.sender_id == current_user.id 
        receiver = User.find(conversation.receiver_id)
      else
        receiver = User.find(conversation.sender_id) 
      end 
    end
  end
end
