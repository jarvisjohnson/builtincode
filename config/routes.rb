Rails.application.routes.draw do

  devise_for :clients, :controllers => { :omniauth_callbacks => "clients/omniauth_callbacks" }

  # devise_scope :client do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_client_session
  # end


  resources :clients
  resources :subscriptions  

  # Consume Stripe Webhooks: https://github.com/integrallis/stripe_event
  mount StripeEvent::Engine, at: '/stripe_webhooks' # provide a custom path  

  root to: "dashboard#index"
  
end
