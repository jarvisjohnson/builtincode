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

require 'rails_helper'

RSpec.describe SupportConversation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
