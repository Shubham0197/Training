Rails.application.routes.draw do
  root 'users#index'
  get 'users/signup'
  post 'users/create'
  resources :users do 
    collection do
      get 'sorting'
    end 
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
