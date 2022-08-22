Rails.application.routes.draw do

  get '/employees/search', to: 'employees#search'
  get '/devices/search',to: 'devices#search'
  resources :employees
  resources :devices
end
