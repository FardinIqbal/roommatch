Rails.application.routes.draw do
  root "swipes#show"

  devise_for :users

  resource :filters, only: [:edit, :update]
  resource :profiles, only: [:edit, :update]
  resources :swipes, only: [:show, :create]
  resources :matches, only: [:index]

  # Health check (keep this if you want)
  get "up" => "rails/health#show", as: :rails_health_check
end
