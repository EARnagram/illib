Rails.application.routes.draw do
  get 'comics/_form'

  get 'comics/edit'

  get 'comics/index'

  get 'comics/new'

  get 'comics/show'

  root to: 'users#index'
  get 'login', to: 'sessions#new'
  resources :comics
  resources :users, only: [:index, :show, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
