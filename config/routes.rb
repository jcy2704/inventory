Rails.application.routes.draw do
  root to: 'products#index'

  resources :users, except: %i[new edit show]
  resources :products, except: %i[new edit destroy]
  resources :groups, except: %i[new edit]

  get '/new_user', to: 'users#new', as: 'new_user'
  get '/login', to: 'users#login'
  post '/login', to: 'users#new_login'
  get '/logout', to: 'users#logout'
  get '/edit_user/:id', to: 'users#edit', as: 'edit_user'
  delete '/avatar_delete/:id', to: 'users#remove_avatar', as: 'remove_avatar'

  get '/new_product', to: 'products#new', as: 'new_product'
  get '/edit_product/:id', to: 'products#edit', as: 'edit_product'
  delete '/product/:id', to: 'products#destroy', as: 'product_delete'
  get '/delete_product', to: 'products#delete_product'

  get '/new_group', to: 'groups#new', as: 'new_group'
  get '/edit_group/:id', to: 'groups#edit', as: 'edit_group'
  delete '/icon_delete/:id', to: 'groups#remove_icon', as: 'remove_icon'

  get 'carts/:id', to: 'carts#show', as: 'cart'
  delete 'carts/:id', to: 'carts#destroy'

  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"

  post 'sales', to: 'sales#create'
end

