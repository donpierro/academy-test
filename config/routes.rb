Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users
  resources :cities
  get 'all_users', to: 'users#index'
end
