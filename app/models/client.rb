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
         :omniauth_providers => [:facebook, :google_oauth2]

  #paperclip
  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "default_avatar.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/         

  #relation to websites
  has_many :websites, dependent: :destroy 
  
  # Omniauth login
  # https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
    def self.from_facebook_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |client|
        if auth.info.email?
          client.email = auth.info.email
        else
          client.email = "facebook_user: #{auth.info.name}"
        end
        client.password = Devise.friendly_token[0,20]
        client.contact_name = auth.info.name
        # client.name = auth.info.name   # assuming the client model has a name
        client.oauth_avatar = auth.info.image # assuming the client model has an image
        # If you are using confirmable and the provider(s) you use validate emails, 
        # uncomment the line below to skip the confirmation emails.
        client.skip_confirmation!
      end
    end         

    def self.from_google_omniauth(access_token)
        data = access_token.info
        # granular = access_token.extra.raw_info
        client = Client.where(:email => data["email"]).first

        # Uncomment the section below if you want clients to be created if they don't exist
        unless client
            client = Client.create(
              email: data["email"],
              password: Devise.friendly_token[0,20],
              provider: "google",
              oauth_avatar: data["image"],
              contact_name: data["name"]
            )
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

  protected

    # def email_required?
    #   false
    # end

end
