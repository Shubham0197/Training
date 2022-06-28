Rails.application.routes.draw do
  get 'flights/index'
  get 'flights/new'
  get 'flights/create'
  get 'flights/edit'
  get 'flights/update'
  get 'flights/destroy'
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
  get 'aircraft/delete/:id', to: "aircraft#delete"
  get 'aircraft/destroy'

  namespace :admin do
    get 'delete/:id', to: "aircraft#delete"
    resources :employees
    resources :aircraft

    resources :certifieds do
      member do
        get :certifieds_mapping
      end
      collection do
        get :pilots
      end
    end
  end
  scope :admin do
    resources :employees
    resources :aircraft

  end
  scope module: :admin do
   # resources :aircrafts
  end

 #  get 'aircraft/edit(:id)'
  resources :aircraft, :employees, :flights
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :flight do
    resources :flights_aircrafts
  end
end
