# == Schema Information
#
# Table name: support_conversations
#
#  id          :integer          not null, primary key
#  author_id   :integer
#  receiver_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_support_conversations_on_author_id                  (author_id)
#  index_support_conversations_on_author_id_and_receiver_id  (author_id,receiver_id) UNIQUE
#  index_support_conversations_on_receiver_id                (receiver_id)
#

class SupportConversation < ApplicationRecord
  
  # https://www.sitepoint.com/build-a-messaging-system-with-rails-and-actioncable/  
  belongs_to :author, class_name: 'Client'
  belongs_to :receiver, class_name: 'Client'  
  has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy
  validates :author, uniqueness: {scope: :receiver}

end
