# == Schema Information
#
# Table name: websites
#
#  id                     :integer          not null, primary key
#  client_id              :integer
#  features_id            :integer
#  billing_units          :integer          default(30)
#  name                   :string(255)
#  app_type               :string(255)
#  ssl                    :boolean          default(FALSE)
#  cdn                    :boolean          default(FALSE)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  billing_currency       :string(255)      default("AUD")
#  paid                   :boolean
#  stripe_subscription_id :string(255)
#  hosting_units          :string(255)
#  monthly_cost_cents     :integer          default(2500)
#  production_url         :string(255)
#  staging_url            :string(255)
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
