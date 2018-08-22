Rails.application.routes.draw do
  resources :venues
  resources :events
  resources :users

  get '/profile', to: 'users#profile', as: 'profile'
  get '/profile/edit', to: 'users#edit', as: 'edit_profile'

  get '/login', to: 'sessions#new', as: 'login'
  get '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
end
