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

class Message < ApplicationRecord
  belongs_to :support_conversation
  belongs_to :client
  validates :body, presence: true
  #paperclip
  has_attached_file :attached_image, styles: { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :attached_image, content_type: /\Aimage\/.*\z/     
end
