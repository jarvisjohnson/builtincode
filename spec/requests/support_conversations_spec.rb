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

require 'rails_helper'

RSpec.describe "SupportConversations", type: :request do
  describe "GET /support_conversations" do
    it "works! (now write some real specs)" do
      get support_conversations_path
      expect(response).to have_http_status(200)
    end
  end
end
