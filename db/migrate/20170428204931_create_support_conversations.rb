class CreateSupportConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :support_conversations do |t|
      t.integer :author_id
      t.integer :receiver_id

      t.timestamps
    end
    add_index :support_conversations, :author_id
    add_index :support_conversations, :receiver_id
    add_index :support_conversations, [:author_id, :receiver_id], unique: true
  end
end
