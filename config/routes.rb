Rails.application.routes.draw do

  devise_for :users
  root to: 'events#index'
  resources :users, only: %i[edit update]
  
  
  resources :top, only: :index
  resources :events
  resources :diary
  resources :tasks
  resources :targets
end
