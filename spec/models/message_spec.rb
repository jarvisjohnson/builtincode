# == Schema Information
#
# Table name: messages
#
#  id                          :integer          not null, primary key
#  body                        :text(65535)
#  support_conversation_id     :integer
#  client_id                   :integer
#  stores_id                   :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  attached_image_file_name    :string(255)
#  attached_image_content_type :string(255)
#  attached_image_file_size    :integer
#  attached_image_updated_at   :datetime
#
# Indexes
#
#  index_messages_on_client_id                (client_id)
#  index_messages_on_stores_id                (stores_id)
#  index_messages_on_support_conversation_id  (support_conversation_id)
#

require 'rails_helper'

RSpec.describe Message, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
