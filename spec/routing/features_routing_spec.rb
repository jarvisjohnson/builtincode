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

require "rails_helper"

RSpec.describe FeaturesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/features").to route_to("features#index")
    end

    it "routes to #new" do
      expect(:get => "/features/new").to route_to("features#new")
    end

    it "routes to #show" do
      expect(:get => "/features/1").to route_to("features#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/features/1/edit").to route_to("features#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/features").to route_to("features#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/features/1").to route_to("features#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/features/1").to route_to("features#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/features/1").to route_to("features#destroy", :id => "1")
    end

  end
end
