Rails.application.routes.draw do
  get 'users/index'
  root 'homepage#index'
  get 'homepage/index'
  get 'homepage/about', to: 'homepage#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
