require "sidekiq/web"

Rails.application.routes.draw do
  get "posts/index"
  get "posts/show"
  get "posts/new"
  get "posts/create"
  get "posts/edit"
  get "posts/update"
  get "posts/destroy"
  devise_for :users

  authenticate :user do
    mount Sidekiq::Web => "/sidekiq"
  end

  # root "posts#index"
end
