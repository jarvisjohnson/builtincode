class ApplicationController < ActionController::Base
  # before_action :authenticate_client!
  protect_from_forgery with: :exception
  # before_action :set_client
  before_action :configure_permitted_parameters, if: :devise_controller?
  # https://github.com/plataformatec/devise/wiki/How-To:-Create-custom-layouts
  layout :layout_by_resource

  # def after_sign_in_path_for(resource)
  #   # request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  #   dashboard_index_path
  # end  

  def after_sign_out_path_for(resource)
    new_client_session_path
  end  

  def after_sign_in_path_for(resource)
    dashboard_index_path
  end    

  protected

  def configure_permitted_parameters
    attributes = [:avatar, :email, :contact_name, :business_name, :billing_currency, websites_attributes: [
        :id, :name, :ssl, :cdn, :_destroy, :app_type, :billing_units, :monthly_cost_cents, :production_url, :staging_url, features_attributes: [
          :name, :quantity, :billing_units, :_destroy
        ]
      ]
    ]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    devise_parameter_sanitizer.permit(:accept_invitation, keys: attributes)
    devise_parameter_sanitizer.permit(:invite, keys: attributes)
  end  

  private

  def layout_by_resource
    if devise_controller?
      "clients"
    else
      "application"
    end
  end 



  # def set_client
  #   @client = current_client
  #   # @subscribed = @client.stripe_subscription_id? if @client
  #   # @no_email = @client.email.exclude?('@') if @client
  # #   @client_currency = @client.billing_currency if @client
  # end    

end
