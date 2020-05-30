Rails.application.routes.draw do
  devise_for :users

  resources :items do
    resources :likes, only:[:create,:destroy]
    resources :comments,only:[:create,:destroy]
    resources :used,only:[:index,:new,:create]
    resources :favorite,only:[:index,:new,:create]
  end
  namespace :users do
    resources :searches, only: [:index]
  end
  resources :users, only: [:index,:show]

  root to: 'items#index'

end
