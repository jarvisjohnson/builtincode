class AddBelongsToWebsiteToSupportConversation < ActiveRecord::Migration[5.0]
  def change
    add_reference :support_conversations, :website, foreign_key: true
    # add_index :support_conversations, :website_id
  end
end
