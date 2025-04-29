Rails.application.routes.draw do
  # 1️⃣ Signed-in users hit swipes#show at "/"
  authenticated :user do
    root "swipes#show", as: :authenticated_root
  end

  # 2️⃣ Everyone else (and defini­tively defines root_path) → home#index
  root "home#index"    # <–– this defines root_path again

  devise_for :users

  resource :filters, only: [:edit, :update] do
    post :reset, on: :collection
  end

  resource :profiles, only: [:edit, :update]
  resources :swipes,   only: [:show, :create]
  resources :matches,  only: [:index]

  resources :users, only: [] do
    resources :messages, only: [:index, :create]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
