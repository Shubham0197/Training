Rails.application.routes.draw do

  resources :cities
  devise_for :employees
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'flights#index'
  get 'aircraft/index'
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

  get 'aircraft/show'
  get 'aircraft/practice'
  get 'aircraft/index'
  get 'aircraft/new'
  get 'delete/:id', to: "aircraft#delete"
  get 'aircraft/destroy'

  resources :aircraft, :employees, :flights
  resources :flight do
    resources :flights_aircrafts
  end
  resources :schedules
  resources :certifieds
end
