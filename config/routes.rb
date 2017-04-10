Rails.application.routes.draw do

  devise_for :clients
  root to: "home#index"

  resources :clients
  resources :subscriptions

  # https://github.com/integrallis/stripe_event
  mount StripeEvent::Engine, at: '/stripe_webhooks' # provide a custom path  
  
end
