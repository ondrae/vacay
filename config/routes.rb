Rails.application.routes.draw do
  root to: "pages#index"

  devise_for :users
  # resources :users do
  #   resources :maps, shallow: true do
  #     resources :points, shallow: true
  #   end
  # end
end
