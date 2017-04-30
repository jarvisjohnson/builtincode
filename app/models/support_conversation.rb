# == Schema Information
#
# Table name: support_conversations
#
#  id          :integer          not null, primary key
#  author_id   :integer
#  receiver_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  website_id  :integer
#
# Indexes
#
#  index_support_conversations_on_author_id    (author_id)
#  index_support_conversations_on_receiver_id  (receiver_id)
#  index_support_conversations_on_website_id   (website_id)
#

class SupportConversation < ApplicationRecord
  
  # https://www.sitepoint.com/build-a-messaging-system-with-rails-and-actioncable/  
  belongs_to :author, class_name: 'Client'
  belongs_to :receiver, class_name: 'Client'
  belongs_to :website, optional: true  
  has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy, inverse_of: :support_conversation
  # validates :author, uniqueness: {scope: :receiver}
  accepts_nested_attributes_for :messages

  scope :participating, -> (client) do
    where("(support_conversations.author_id = ? OR support_conversations.receiver_id = ?)", client.uuid, client.uuid)
  end  

  scope :between, -> (sender_id, receiver_id) do
    where(author_id: sender_id, receiver_id: receiver_id).or(where(author_id: receiver_id, receiver_id: sender_id)).limit(1)
  end

  def with(current_client)
    author == current_client ? receiver : author
  end 

   def participates?(client)
    author == client || receiver == client
  end

end
