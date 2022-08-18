Rails.application.routes.draw do
  resources :groceries
  resources :cities
  get 'hello_world/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  get '/users', to: 'home#user'
end
