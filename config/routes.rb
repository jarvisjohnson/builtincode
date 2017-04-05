Rails.application.routes.draw do

  
  # Added by Koudoku.
  mount Koudoku::Engine, at: 'koudoku'
  scope module: 'koudoku' do
    get 'pricing' => 'subscriptions#index', as: 'pricing'
  end


  devise_for :clients
  root to: "home#index"
  
end
