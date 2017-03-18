Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index'
  resources :dishes, only: [:index, :show]
  resources :ingredients, only: :index
  resources :categories, only: :index
end
