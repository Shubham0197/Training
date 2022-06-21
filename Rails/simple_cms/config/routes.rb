Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/delete'
  get 'users/destroy'
  root 'users#index'
  get 'demo/index'
  get 'demo/hello'
  # defaults routes
  # get ':controller(/:action(/:id))'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    member do
      get :delete
    end
  end
end
