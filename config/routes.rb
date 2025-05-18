Rails.application.routes.draw do
  devise_for :users
  resource :profile, only: [:show, :edit, :update]

  resources :users, only: [:show] do
    resource :follow, only: [:create, :destroy]
  end
  
  resources :posts do
    resources :comments, only: [ :new, :create, :edit, :update, :destroy ]
    resources :likes, only: [ :create, :destroy ]
  end

   mount Shrine.derivation_endpoint => "derivations"

  root "posts#index"
  get "/assets/tailwindcss", to: redirect("/assets/application.css")
  get "/manifest.json", to: "application#manifest"
  get '/manifest', to: 'application#manifest'
end
