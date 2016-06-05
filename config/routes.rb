Rails.application.routes.draw do
  get 'rides/create'

  root 'sessions#home'
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  post '/sessions' => 'sessions#create'
  get '/signin', :to => "users#signin"
  resources :attractions
  resources :rides
  resources :users

end
