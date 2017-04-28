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

require "rails_helper"

RSpec.describe SupportConversationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/support_conversations").to route_to("support_conversations#index")
    end

    it "routes to #new" do
      expect(:get => "/support_conversations/new").to route_to("support_conversations#new")
    end

    it "routes to #show" do
      expect(:get => "/support_conversations/1").to route_to("support_conversations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/support_conversations/1/edit").to route_to("support_conversations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/support_conversations").to route_to("support_conversations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/support_conversations/1").to route_to("support_conversations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/support_conversations/1").to route_to("support_conversations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/support_conversations/1").to route_to("support_conversations#destroy", :id => "1")
    end

  end
end
