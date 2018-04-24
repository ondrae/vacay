Rails.application.routes.draw do
  root to: "pages#index"

  devise_for :users
  resources :users
  resources :maps
  post '/search' => 'maps#search'
  resources :points
end
