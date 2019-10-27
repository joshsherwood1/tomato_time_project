Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/register", to: "users#new"
  resources :games, only: [:new, :create]


  # Routes for Google authentication
  get "/auth/:provider/callback", to: "sessions#googleAuth"
  get "/auth/failure", to: redirect("/")
  get "/profile", to: "users#show"


  resources :games, only:[:index, :destroy]

end
