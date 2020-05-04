Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index ,:new, :create,:edit,:update,:show] do
    resources :used,only:[:index,:new,:create]
  end
  resources :users, only: [:show]
end
