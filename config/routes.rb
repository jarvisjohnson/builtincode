Rails.application.routes.draw do

  devise_for :clients, :controllers => {
    :omniauth_callbacks   =>   'clients/omniauth_callbacks',
    :confirmations        =>   'clients/confirmations',
    :registrations        =>   'clients/registrations',
    :invitations          =>   'clients/invitations'
  }

  resources :websites

  resources :clients do
    member do 
      get :index_invoices
    end    
    resources :websites do 
      resources :subscriptions
      resources :features
    end
  end

  

  # Consume Stripe Webhooks: https://github.com/integrallis/stripe_event
  mount StripeEvent::Engine, at: '/stripe_webhooks' # provide a custom path


  root to: "dashboard#index"

end
