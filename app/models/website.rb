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
#  live_status            :string(255)      default("live")
#
# Indexes
#
#  index_websites_on_client_id    (client_id)
#  index_websites_on_features_id  (features_id)
#

class Website < ApplicationRecord
  belongs_to :client, inverse_of: :websites
  has_many :features, dependent: :destroy, inverse_of: :website
  accepts_nested_attributes_for :features
  before_save :calculate_monthly_cost


  def calculate_monthly_cost
    monthly = 0
    monthly += self.billing_units
    
    # Add value of each feature into monthly cost
    self.features.each do |feature|
      monthly += (feature.billing_units * feature.quantity)
    end

    # raise
    self.monthly_cost_cents = monthly * 100
    self.hosting_units = monthly
  end


end
