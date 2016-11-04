class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, index: true
      t.references :conversation, index: true
      t.text :body
      t.boolean :opened, default: false
    end
  end
end
