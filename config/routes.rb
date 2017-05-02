Rails.application.routes.draw do


  get 'errors/not_found'

  get 'errors/internal_server_error'

  get 'pages/welcome'
  get 'pages/terms'
  get 'pages/privacy'
  # get 'pages/swish_privacy'

  get "dashboard/index"  

  get 'react_examples/component', to: 'react_examples#component', as: :component
  
  devise_for :clients, :controllers => {
    :omniauth_callbacks   =>   'clients/omniauth_callbacks',
    :confirmations        =>   'clients/confirmations',
    :registrations        =>   'clients/registrations',
    :invitations          =>   'clients/invitations'
  }

  resources :websites

  resources :messages, only: [:new, :create]
  resources :support_conversations, only: [:index, :show, :new, :create]

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

  # https://mattbrictson.com/dynamic-rails-error-pages
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  

  # Consume Stripe Webhooks: https://github.com/integrallis/stripe_event
  mount StripeEvent::Engine, at: '/stripe_webhooks' # provide a custom path

  root to: "pages#welcome"

end
