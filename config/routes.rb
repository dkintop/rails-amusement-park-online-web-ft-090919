Rails.application.routes.draw do
  root :to => ""
  resources :users, only: [:new]

end
