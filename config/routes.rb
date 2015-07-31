Rails.application.routes.draw do
  root to: 'users#index'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get 'loan_check/:comic_id', to: 'comics#loan_check'
  get 'checkin_check/:comic_id', to: 'comics#checkin_check'
  get 'checkin/:comic_id', to: 'comics#checkin'
  post 'loan/:comic_id', to: 'comics#loan'
  resources :comics
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
