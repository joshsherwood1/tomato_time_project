Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/register", to: "users#new"
  get "/calculate_score", to: "games#calculate_score"
  resources :games, only: [:new, :create, :show]
  namespace :games do
    get "/:id/end", to: "end#show"
  end
  # Routes for Google authentication
  get "/auth/:provider/callback", to: "sessions#googleAuth"
  get "/auth/failure", to: redirect("/")
  get "/profile", to: "users#show"
  delete "/profile", to: "games_score#destroy"

  resources :games, only:[:index, :destroy]
end
