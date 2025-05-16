require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments, only: [ :new, :create, :edit, :update, :destroy ]
    resources :likes, only: [ :create, :destroy ]
  end

  authenticate :user do
    mount Sidekiq::Web => "/sidekiq"
  end

   mount Shrine.derivation_endpoint => "derivations"

   if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
   end

  root "posts#index"
  get "/assets/tailwindcss", to: redirect("/assets/application.css")
  get "/manifest.json", to: "application#manifest"
end
