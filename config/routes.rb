require 'sidekiq/web'

Rails.application.routes.draw do
  get '/login', to: 'session#new'

  post '/login', to: 'session#create'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  post 'session/destroy', to: 'session#destroy' 

  delete '/users/:user_id/saved_msgs', to: 'saved_msgs#destroyAll'

  get "/logout" => "session#destroy" #TODO: DELETE THIS BEFORE PRODUCTION

  root 'site#index'

  resources :users do
    resources :saved_msgs
  end

  resources :passwords

  resources :unsaved_msgs


  mount Sidekiq::Web => '/sidekiq'

end
