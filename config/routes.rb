Rails.application.routes.draw do
get '/employees/search', to: 'employees#search'
get '/devices/search',to: 'devices#search'
   resources :employees
   # get '/employees/search', to: 'employees#search'
  resources :devices
  #get   '/employees/search',to: 'employees#search'
end
