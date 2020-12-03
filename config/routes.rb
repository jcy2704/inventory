Rails.application.routes.draw do
  root to: 'products#index'

  resources :users
  resources :products
  resources :groups

  get '/register', to: 'users#new'
  get '/login', to: 'users#login'
  post '/login', to: 'users#new_login'
  get '/logout', to: 'users#logout'
  get '/edit_user/:id', to: 'users#edit'

  get '/new_product', to: 'products#new'
  get '/edit_product/:id', to: 'products#edit'

  get '/new_group', to: 'groups#new'
  get '/edit_group/:id', to: 'groups#edit'
end
