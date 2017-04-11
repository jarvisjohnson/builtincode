class ApplicationController < ActionController::Base
  # before_action :authenticate_client!
  protect_from_forgery with: :exception
  before_action :set_client
  before_action :configure_permitted_parameters, if: :devise_controller?

  # https://github.com/plataformatec/devise/wiki/How-To:-Create-custom-layouts
  layout :layout_by_resource

  protected

  def configure_permitted_parameters
    attributes = [:email, :avatar]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end  

  private

  def layout_by_resource
    if devise_controller?
      "clients"
    else
      "application"
    end
  end  

  def set_client
    @client = current_client
    @subscribed = @client.stripe_subscription_id? if @client
    @no_email = @client.email.exclude?('@') if @client
    @client_currency = @client.billing_currency if @client
  end    

end
