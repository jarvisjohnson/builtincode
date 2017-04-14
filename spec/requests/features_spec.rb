# == Schema Information
#
# Table name: features
#
#  id            :integer          not null, primary key
#  website_id    :integer
#  billing_units :integer          default(2)
#  quantity      :integer          default(1)
#  name          :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_features_on_website_id  (website_id)
#

require 'rails_helper'

RSpec.describe "Features", type: :request do
  describe "GET /features" do
    it "works! (now write some real specs)" do
      get features_path
      expect(response).to have_http_status(200)
    end
  end
end
