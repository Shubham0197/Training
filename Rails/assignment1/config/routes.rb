Rails.application.routes.draw do
  get 'hello_world/index'
  root "users#index"
  
  get "users/api"

  resources :users do
    collection do
      post :import
    end
  end


  namespace :api do
    namespace :v1 do
      post "login", to: "authentications#login"
      get "users/create"
    end
  end


  namespace :api do
    namespace :v1 do
      resources :users
    end
  end

  namespace :api do
    namespace :v1 do
      resources :assignments
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
