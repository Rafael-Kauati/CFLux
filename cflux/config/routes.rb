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

  post '/home/create_transaction', to: 'home#create_transaction', as: :create_transaction
  get '/home/:id/edit_transaction', to: 'home#edit_transaction', as: :edit_transaction
  patch '/home/:id/update_transaction', to: 'home#update_transaction', as: :update_transaction
  delete '/home/:id/destroy_transaction', to: 'home#destroy_transaction', as: :destroy_transaction


  # Resourceful routes for transactions
  resources :transactions, only: [:new, :create, :index, :edit, :update, :show, :destroy]

  # Resources for singin controller with only new and create actions
  resources :singin, only: [:new, :create]

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Route for HomeController

end