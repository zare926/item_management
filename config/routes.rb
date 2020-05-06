Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :used,only:[:index,:new,:create]
  end
  resources :users, only: [:show]
end
