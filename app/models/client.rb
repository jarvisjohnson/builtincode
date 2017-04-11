class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
  
  # Omniauth login
  # https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |client|
        client.email = auth.info.email
        client.password = Devise.friendly_token[0,20]
        # client.name = auth.info.name   # assuming the client model has a name
        # client.avatar = auth.info.image # assuming the client model has an image
        # If you are using confirmable and the provider(s) you use validate emails, 
        # uncomment the line below to skip the confirmation emails.
        # client.skip_confirmation!
        # raise
      end
    end         

    def self.from_google_omniauth(access_token)
        data = access_token.info
        client = Client.where(:email => data["email"]).first

        # Uncomment the section below if you want clients to be created if they don't exist
        unless client
            client = Client.create(
              email: data["email"],
              password: Devise.friendly_token[0,20]
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

end
