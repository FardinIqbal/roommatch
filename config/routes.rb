Rails.application.routes.draw do
  root "swipes#show"

  devise_for :users

  resource :filters, only: [:edit, :update] do
    post :reset, on: :collection
  end

  resource :profiles, only: [:edit, :update]
  resources :swipes, only: [:show, :create]
  resources :matches, only: [:index]

  # Messaging between matched users
  resources :users, only: [] do
    resources :messages, only: [:index, :create]
  end

  # Health check (optional)
  get "up" => "rails/health#show", as: :rails_health_check
end
