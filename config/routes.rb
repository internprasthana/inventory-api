Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :users, param: :_username
    post '/auth/login', to: 'authentication#login'
    resources :employees
    resources :devices

    resources :devices
  resources :employees,except: [:new] do
    member do
      get 'devices'
      #post 'chargers'
    end
  end
  get 'signup',to: 'employees#new'
  get 'login',to: 'sessions#new'
  post 'login',to: 'sessions#create'
  delete 'logout',to: 'sessions#destroy'

  # post 'password/forgot', to: 'password#forgot'
  # post 'password/reset', to: 'password#reset'
  #
  # put 'password/update', to: 'password#update'


end
