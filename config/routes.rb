Rails.application.routes.draw do
  root to: 'users#index'
  get 'login', to: 'sessions#new'

  resources :users, only: [:index, :show, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
