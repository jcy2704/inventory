Rails.application.routes.draw do
  resources :users

  get '/register', to: 'users#new'
  get '/login', to: 'users#login'
  post '/login', to: 'users#new_login'
  get '/logout', to: 'users#logout'
end
