Rails.application.routes.draw do
  resources :products, only: :index
  resources :prices, only: :create
  resources :insurances, only: :create
end
