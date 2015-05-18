Rails.application.routes.draw do
  use_doorkeeper
  use_doorkeeper
  devise_for :accounts, controllers: {
    registrations: 'accounts/registrations'
  }

  root 'home#index'

  get :ping, controller: :application, action: :ping
  get :awaiting_confirmation, to: 'info_messages#awaiting_confirmation'
  get 'accounts/current', to: 'accounts#show', format: :json

  resources :accounts, only: [:show], format: :json
end
