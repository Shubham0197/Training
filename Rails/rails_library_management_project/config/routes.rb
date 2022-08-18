Rails.application.routes.draw do
  resources :papers
  get 'home/index'
  get 'home/books'
  get '/books', to: 'home#books'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
