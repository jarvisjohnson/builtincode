class Clients::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def facebook
    @client = Client.from_omniauth(request.env["omniauth.auth"], current_client)
    if @client.persisted?
      sign_in_and_redirect @client, :event => :authentication #this will throw if @client is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_client_registration_url
    end
  end

  def google_oauth2
    @client = Client.from_omniauth(request.env["omniauth.auth"], current_client)

    if @client.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @client, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"].except(:extra) #Removing extra as it can overflow some session stores
      redirect_to new_client_registration_url, alert: @client.errors.full_messages.join("\n")
    end
  end

  def linkedin
    @client = Client.from_omniauth(request.env["omniauth.auth"], current_client)

    if @client.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Linkedin"
      sign_in_and_redirect @client, :event => :authentication
    else
      session["devise.linkedin_data"] = request.env["omniauth.auth"].except(:extra) #Removing extra as it can overflow some session stores
      redirect_to new_client_registration_url, alert: @client.errors.full_messages.join("\n")
    end
  end  

  def failure
    redirect_to root_path
  end  

end