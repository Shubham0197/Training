Rails.application.routes.draw do
  get 'users/index'

  root 'homepage#index'

  get 'homepage/index'
  get 'homepage/about', to: 'homepage#about'

  get "sign_up", to: "users#new"
  post "sign_up", to: "users#create"

  delete "logout", to: "sessions#destroy"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "password", to: "users#edit", as: :edit_password
  patch "password", to: "users#update"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"

  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "auth/twitter/callback", to: "omniauth_callbacks#twitter"
  
  resources :twitter_accounts
  resources :tweets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
