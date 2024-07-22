Rails.application.routes.draw do
  get 'home/index'
  get 'login/index'
  get 'login/create'
  get 'singin/new'
  get 'singin/create'
  get '/singin', to: 'singin#new'
  post '/singin', to: 'singin#create'

  get '/login', to: 'login#index'
  post '/login', to: 'login#create'

  get 'frontpage/index'
  root 'frontpage#index'
  get '/home', to: 'home#index'

  # Resources for singin controller with only new and create actions
  resources :singin, only: [:new, :create]

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Route for HomeController

end