Rails.application.routes.draw do
 post '/auth/login', to: 'authentications#login'
 get '/employees/search', to: 'employees#search'
 get '/devices/search',to: 'devices#search'

 resources :users
 resources :employees
 resources :devices
end
