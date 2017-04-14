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
#
# Indexes
#
#  index_websites_on_client_id    (client_id)
#  index_websites_on_features_id  (features_id)
#

require 'rails_helper'

RSpec.describe "Websites", type: :request do
  describe "GET /websites" do
    it "works! (now write some real specs)" do
      get client_websites_path(params[:client_id])
      expect(response).to have_http_status(200)
    end
  end
end
