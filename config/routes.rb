require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [ :show ]
  resources :posts

  authenticate :user do
    mount Sidekiq::Web => "/sidekiq"
  end

  # root "posts#index"
end
