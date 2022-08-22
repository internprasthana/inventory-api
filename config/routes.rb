Rails.application.routes.draw do
  resources :users, param: :_username
  post '/auth/login', to: 'authentications#login'
  resources :employees
  resources :devices
end
