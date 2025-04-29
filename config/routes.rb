Rails.application.routes.draw do
  root "swipes#show"

  devise_for :users

  resource :filters, only: [:edit, :update] do
    post :reset, on: :collection
  end

  resource :profiles, only: [:edit, :update]
  resources :swipes, only: [:show, :create]
  resources :matches, only: [:index]

  # Health check (optional)
  get "up" => "rails/health#show", as: :rails_health_check
end
