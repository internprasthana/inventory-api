Rails.application.routes.draw do

  put '/passwordsresets',to: 'passwordsresets#update'
  

get    '/devices/search',to: 'devices#search'
get   '/employees/search',to: 'employees#search'


  resources :users
  post '/auth/login', to: 'authenications#login'

     resources :devices
      get    'devices/index', to: 'devices#index'
       patch '/devices/',to: 'devices#update'
        get '/devices/search',to: 'devices#search'



 resources :employees
 resources :passwordsresets
get 'signup',to: 'employees#new'
get 'login',to: 'sessions#new'
post 'login',to: 'sessions#create'
delete 'logout',to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
