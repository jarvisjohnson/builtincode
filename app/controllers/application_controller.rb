class ApplicationController < ActionController::Base
  # before_action :authenticate_client!
  protect_from_forgery with: :exception
  # before_action :set_client

  #META-TAGS: https://www.cookieshq.co.uk/posts/easy-seo-metatags-with-rails-4
  before_action :prepare_meta_tags, if: "request.get?"

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_support_receiver
  # https://github.com/plataformatec/devise/wiki/How-To:-Create-custom-layouts
  layout :layout_by_resource

  def prepare_meta_tags(options={})
    site_name   = "Built in Code"
    title       = [controller_name, action_name].join(" ")
    description = "Built in Code creates enterprise-grade web software. We are Ruby developers in New York City."
    image       = options[:image] || 'logos/Wide.png'
    current_url = request.url

    # Let's prepare a nice set of defaults
    defaults = {
      site:        site_name,
      title:       title,
      image:       image,
      description: description,
      keywords:    %w[web app software development ruby rails NYC website developers],
      icon:        'favicon/favicon.ico',
      publisher:   "https://plus.google.com/104777449937869768317",
      twitter: {
        site_name: site_name,
        site: '@swishwebdev',
        card: 'summary',
        description: description,
        image: image
      },
      og: {
        url: current_url,
        site_name: site_name,
        title: title,
        image: image,
        description: description,
        type: 'website'
      }
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end

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

  def set_support_receiver
    @support_receiver = Client.find_by(admin: true)
    # @support_conversation = current_client.authored_support_conversations.build
  end

  # def set_client
  #   @client = current_client
  #   # @subscribed = @client.stripe_subscription_id? if @client
  #   # @no_email = @client.email.exclude?('@') if @client
  # #   @client_currency = @client.billing_currency if @client
  # end    

end
