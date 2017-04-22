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
#
# Indexes
#
#  index_clients_on_confirmation_token    (confirmation_token) UNIQUE
#  index_clients_on_email                 (email) UNIQUE
#  index_clients_on_invitation_token      (invitation_token) UNIQUE
#  index_clients_on_invitations_count     (invitations_count)
#  index_clients_on_invited_by_id         (invited_by_id)
#  index_clients_on_reset_password_token  (reset_password_token) UNIQUE
#

class Client < ApplicationRecord
  # include ActiveUUID::UUID
  # natural_key :created_at
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :omniauthable,
         :omniauth_providers => [:facebook, :google_oauth2, :linkedin]

  #paperclip
  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "default_avatar.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/         

  #relation to websites
  has_many :websites
  accepts_nested_attributes_for :websites, :reject_if => :all_blank, :allow_destroy => true
  
  # Omniauth login
  # https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
    def self.from_omniauth(auth, current_client)

      if current_client
        client = current_client
      elsif Client.where(email: auth.info.email)
        client = Client.where(email: auth.info.email).first
      else
        client = nil
      end
      # client = current_client ? current_client : nil
      # client = current_client
      unless client
          client = Client.create(
            email:  auth.info.email ? auth.info.email : "oauth_user: #{auth.info.name}",
            password: Devise.friendly_token[0,20],
            contact_name: auth.info.name,
            oauth_avatar: auth.info.image,
            provider: auth.provider, 
            uid: auth.uid
          )
          client.skip_confirmation!
      else
          client.update_attributes(
            contact_name: auth.info.name,
            oauth_avatar: auth.info.image,
            provider: auth.provider, 
            uid: auth.uid
          )      
          client.save
      end
      client
    end         

    def self.new_with_session(params, session)
      super.tap do |client|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          client.email = data["email"] if client.email.blank?
        end
      end
    end  

    # http://stackoverflow.com/questions/21370461/connect-twitter-account-to-existing-devise-account    

    def has_connection_with(provider)
      auth = self.provider
      if (auth.present? and auth == provider)
        self.uid.present?
      else
        false
      end
    end    

  protected

    # def email_required?
    #   false
    # end

end
