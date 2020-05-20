Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :used,only:[:index,:new,:create]
    resources :favorite,only:[:index,:new,:create]
  end
  namespace :users do
    resources :searches, only: [:index]
  end
  resources :users, only: [:index,:show]
end
