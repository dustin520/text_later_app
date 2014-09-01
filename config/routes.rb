require 'sidekiq/web'

Rails.application.routes.draw do
  get '/login', to: 'session#new'

  post '/login', to: 'session#create'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  post 'session/destroy', to: 'session#destroy' 

  get "/logout" => "session#destroy" #TODO: DELETE THIS BEFORE PRODUCTION

  root 'users#index'

  resources :users do
    resources :saved_msgs
  end

  resources :passwords

  resources :unsaved_msgs


  mount Sidekiq::Web => '/sidekiq'

end
