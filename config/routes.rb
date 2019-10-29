require 'sidekiq/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/register", to: "users#new"
  get "/calculate_score", to: "games#calculate_score"

  resources :games, except: [:edit, :update]

  namespace :games do
    get "/:id/end", to: "end#show"
  end

  mount Sidekiq::Web => '/sidekiq'

  # Routes for Google authentication
  get "/auth/:provider/callback", to: "sessions#googleAuth"
  get "/auth/failure", to: redirect("/")
  get "/profile", to: "users#show"
end
