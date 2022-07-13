Rails.application.routes.draw do
  root 'users#index'
  post 'users/signup'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
