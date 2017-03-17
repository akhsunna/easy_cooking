Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index'
  resources :dishes, only: :index
  resources :ingredients, only: :index
  resources :categories, only: :index
end
