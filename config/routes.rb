Rails.application.routes.draw do
  
  resources :games
  # Landing Page
  root to: "static#index"
  
  # SIGNUP, LOGIN, LOGOUT
  # ------------------------
  get '/login', to: 'session#new', as: 'login'
  post '/login', to: 'session#create'
  
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  
  delete '/logout', to: 'session#destroy', as: 'destroy_user_session'
  ##########################

  # User routes to SHOW, UPDATE and DELETE their accounts
  resources :users, only: [:show, :edit, :update, :destroy]

end
