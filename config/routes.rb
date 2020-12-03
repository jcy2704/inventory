Rails.application.routes.draw do
  root to: 'products#index'

  resources :users
  resources :products

  get '/register', to: 'users#new'
  get '/login', to: 'users#login'
  post '/login', to: 'users#new_login'
  get '/logout', to: 'users#logout'

  get '/new_product', to: 'products#new'
  get '/edit_product/:id', to: 'products#edit'
end
