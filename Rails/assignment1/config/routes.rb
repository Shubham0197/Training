Rails.application.routes.draw do
  root "users#index"
  
  get "users/api"
  resources :users
  namespace :api do
    namespace :v1 do
      post "login", to: "authentications#login"
    end
  end


  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
