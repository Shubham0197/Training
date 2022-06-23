Rails.application.routes.draw do
  get 'employees/index'
  get 'employees/new'
  get 'employees/create'
  get 'employees/show'
  get 'employees/edit'
  get 'employees/update'
  get 'employees/destroy'
  root 'aircraft#index'
  get 'aircraft/show'
  get 'aircraft/index'
  get 'aircraft/new'
 #  get 'aircraft/edit(:id)'
  resources :aircraft, :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :flight do
    resources :flights_aircrafts
  end
end
