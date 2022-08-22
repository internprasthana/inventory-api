Rails.application.routes.draw do
  resources :users
  get '/auth/login', to: 'authentications#login'

  resources :employees
  get '/employees/search', to: 'employees#search'

  resources :devices
  get '/devices/search',to: 'devices#search'

end
