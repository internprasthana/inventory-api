Rails.application.routes.draw do
  resources :users
  post '/auth/login', to: 'authentications#login'
  resources :employees
  resources :devices
end
