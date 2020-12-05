Rails.application.routes.draw do
  root to: 'products#index'

  resources :users, except: %i[new edit show]
  resources :products, except: %i[new edit]
  resources :groups, except: %i[new edit]

  get '/new_user', to: 'users#new', as: 'new_user'
  get '/login', to: 'users#login'
  post '/login', to: 'users#new_login'
  get '/logout', to: 'users#logout'
  get '/edit_user/:id', to: 'users#edit', as: 'edit_user'
  delete '/avatar_delete', to: 'users#remove_avatar', as: 'remove_avatar'

  get '/new_product', to: 'products#new', as: 'new_product'
  get '/edit_product/:id', to: 'products#edit', as: 'edit_product'

  get '/new_group', to: 'groups#new', as: 'new_group'
  get '/edit_group/:id', to: 'groups#edit', as: 'edit_group'
end
