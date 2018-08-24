Rails.application.routes.draw do
  resources :venues
  resources :events
  resources :users

  get '/', to: 'sessions#start', as: 'root'

  patch '/event/:id', to: 'events#add_user', as: 'user_events'
  delete '/event/:id', to: 'events#remove_user', as: 'remove_user'
  #
  get '/profile/:id', to: 'users#show', as: 'profile'
  get '/profile/:id/edit', to: 'users#edit', as: 'edit_profile'

  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/home', to: 'sessions#home', as: 'home'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  post "/events/:event_id/comments", to: "events#create_comment", as: "create_comment"
end
