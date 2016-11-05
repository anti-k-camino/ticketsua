class AddIndexToConversations < ActiveRecord::Migration
  def change
    add_index :conversations, [:sender_id, :receiver_id], unique: true
    add_index :conversations, [:receiver_id, :sender_id], unique: true
  end
end
