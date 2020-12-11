Rails.application.routes.draw do
  root to: 'products#index'

  resources :users, except: %i[show]
  resources :products, :groups, :sale_groups, except: %i[destroy]
  resources :carts, only: %i[show destroy]

  get '/login', to: 'users#login'
  post '/login', to: 'users#new_login'
  get '/logout', to: 'users#logout'
  delete '/avatar_delete/:id', to: 'users#remove_avatar', as: 'remove_avatar'

  delete '/icon_delete/:id', to: 'groups#remove_icon', as: 'remove_icon'

  delete '/icon_delete/:id', to: 'sale_groups#remove_icon', as: 'sale_remove_icon'

  resources :line_items, only: %i[create show destroy] do
    member do
      post 'add', to: "line_items#add_quantity"
      post 'reduce', to: "line_items#reduce_quantity"
    end
  end

  resources :sales, except: %i[destroy edit] do
    collection do
      get 'individual_sales', to: 'sales#individual', as: 'individual'
    end
  end
end


