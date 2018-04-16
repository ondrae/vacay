Rails.application.routes.draw do
  root to: "pages#index"

  devise_for :users
  resources :users
  resources :maps
  resources :points
end
