Rails.application.routes.draw do
  get 'spends/index'
  devise_for :users
  root to: "spends#index"
  resources :spends
  resources :users, only: :show
end
