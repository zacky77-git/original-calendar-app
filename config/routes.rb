Rails.application.routes.draw do
  get 'tasks/index'
  get 'tasks/show'
  get 'tasks/new'
  get 'tasks/edit'
  resources :events
  resources :diary
  devise_for :users
  root to: 'events#index'
  resources :users, only: %i[edit update]
  # resources :rooms, only: [:new, :create, :destroy] do
  # メッセージ送信機能に必要なindexとcreateのルーティングを記述 ネストでチャットルームに属しているメッセージという意味に
  # resources :messages, only: [:index, :create]
  # end

  resources :calendar
  resources :tasks
  resources :targets
end
