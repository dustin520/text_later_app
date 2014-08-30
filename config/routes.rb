Rails.application.routes.draw do
  root 'users#index'

  resources :users do
    resources :saved_msgs
  end

  resources :passwords

  resources :unsaved_msgs

end
