class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.references :sender
      t.references :receiver

      t.timestamps null: false
    end
  end
end
