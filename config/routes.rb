Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :dishes, only: :index
  resources :ingredients, only: :index

  root to: 'home#index'
end
