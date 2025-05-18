require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users
  resource :profile, only: [:show, :edit, :update]

  resources :users, only: [:show] do
    resource :follow, only: [:create, :destroy]
  end

  resources :users, only: [:show]
  
  resources :posts do
    resources :comments, only: [ :new, :create, :edit, :update, :destroy ]
    resources :likes, only: [ :create, :destroy ]
  end

  if Rails.env.development?
    authenticate :user do
      mount Sidekiq::Web => "/sidekiq"
    end
    
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

   mount Shrine.derivation_endpoint => "derivations"

   if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
   end

  root "posts#index"
  get "/assets/tailwindcss", to: redirect("/assets/application.css")
  get "/manifest.json", to: "application#manifest"
  get '/manifest', to: 'application#manifest'
end
