# == Schema Information
#
# Table name: clients
#
#  uuid                   :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string(255)
#  uid                    :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  oauth_avatar           :string(255)
#  invitation_token       :string(255)
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_type        :string(255)
#  invited_by_id          :integer
#  invitations_count      :integer          default(0)
#  contact_name           :string(255)
#  business_name          :string(255)
#  billing_currency       :string(255)      default("AUD")
#  stripe_account_id      :string(255)
#  admin                  :boolean
#  subscribed             :boolean          default(FALSE)
#  receipt_number         :string(255)
#  slug                   :string(255)
#
# Indexes
#
#  index_clients_on_confirmation_token    (confirmation_token) UNIQUE
#  index_clients_on_email                 (email) UNIQUE
#  index_clients_on_invitation_token      (invitation_token) UNIQUE
#  index_clients_on_invitations_count     (invitations_count)
#  index_clients_on_invited_by_id         (invited_by_id)
#  index_clients_on_reset_password_token  (reset_password_token) UNIQUE
#  index_clients_on_slug                  (slug) UNIQUE
#

require "rails_helper"

RSpec.describe ClientsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/clients").to route_to("clients#index")
    end

    it "routes to #new" do
      expect(:get => "/clients/new").to route_to("clients#new")
    end

    it "routes to #show" do
      expect(:get => "/clients/1").to route_to("clients#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/clients/1/edit").to route_to("clients#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/clients").to route_to("clients#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/clients/1").to route_to("clients#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/clients/1").to route_to("clients#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/clients/1").to route_to("clients#destroy", :id => "1")
    end

  end
end
