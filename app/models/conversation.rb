class Conversation < ActiveRecord::Base
  belongs_to :sender, class_name: User, foreign_key: 'sender_id';
  belongs_to :receiver, class_name: User, foreign_key: 'receiver_id'

  has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, scope: :receiver_id
  validates_uniqueness_of :receiver_id, scope: :sender_id

  scope :between, -> (sender_id, receiver_id) do
    where("(conversations.sender_id = ? AND conversations.receiver_id = ?) OR (conversations.sender_id = ? AND conversations.receiver_id = ?)", sender_id,receiver_id, receiver_id, sender_id)
  end

  scope :users_conversations, -> (user_id) do
    where("conversations.sender_id = ? OR conversations.receiver_id = ?", sender_id)
  end
end
