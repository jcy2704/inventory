Rails.application.routes.draw do
  resources :users

  get '/sign_in', to: 'users#sign_in'
  post '/sign_in', to: 'users#new_sign_in'
  get '/sign_out', to: 'users#sign_out'
end
