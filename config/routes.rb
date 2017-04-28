Rails.application.routes.draw do

  resources :support_conversations
  get 'pages/welcome'

  get "dashboard/index"  

  get 'react_examples/component', to: 'react_examples#component', as: :component
  
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
    # member { put :toggle_menu_preference }
    resources :websites do 
      resources :subscriptions
      resources :features
    end
  end

  

  # Consume Stripe Webhooks: https://github.com/integrallis/stripe_event
  mount StripeEvent::Engine, at: '/stripe_webhooks' # provide a custom path

  root to: "pages#welcome"

end
