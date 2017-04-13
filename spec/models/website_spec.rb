# == Schema Information
#
# Table name: websites
#
#  id            :integer          not null, primary key
#  client_id     :integer
#  features_id   :integer
#  billing_units :integer          default("30")
#  name          :string(255)
#  app_type      :string(255)
#  ssl           :boolean          default("0")
#  cdn           :boolean          default("0")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_websites_on_client_id    (client_id)
#  index_websites_on_features_id  (features_id)
#

require 'rails_helper'

RSpec.describe Website, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
