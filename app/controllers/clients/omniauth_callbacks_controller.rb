class Clients::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/client.rb)

    # if request.env["omniauth.auth"].info.email.blank?
    #   redirect_to "/clients/auth/facebook?auth_type=rerequest&scope=email"
    # end

    @client = Client.from_facebook_omniauth(request.env["omniauth.auth"])
    if @client.persisted?
      sign_in_and_redirect @client, :event => :authentication #this will throw if @client is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_client_registration_url
    end
  end

  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/client.rb)
      @client = Client.from_google_omniauth(request.env["omniauth.auth"])

      if @client.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @client, :event => :authentication
      else
        session["devise.google_data"] = request.env["omniauth.auth"].except(:extra) #Removing extra as it can overflow some session stores
        redirect_to new_client_registration_url, alert: @client.errors.full_messages.join("\n")
      end
  end

end