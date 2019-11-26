Rails.application.routes.draw do
  root :to => "static#home"
  resources :users, only: [:new, :show, :index]
  post '/users', to:'users#create'
  get '/signin', to:'sessions#new'
  post '/session', to: 'sessions#create', as: 'session'
  get '/session', to: 
  delete '/session/', to: 'session#destroy', as: 'signout'
end
