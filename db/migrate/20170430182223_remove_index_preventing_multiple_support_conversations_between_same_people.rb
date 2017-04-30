class RemoveIndexPreventingMultipleSupportConversationsBetweenSamePeople < ActiveRecord::Migration[5.0]
  def change
    remove_index(:support_conversations, :name => 'index_support_conversations_on_author_id_and_receiver_id')
  end
end
