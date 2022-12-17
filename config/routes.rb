Rails.application.routes.draw do

  root to: "pages#home"
  resources :categories
  resources :products
  devise_for :users
  
  get 'catering', to: 'pages#catering'
  get 'info', to: 'pages#info'
  get 'menu', to: 'menus#index'
  get 'search', to: 'menus#search'
  
  resources :order_items
  get 'cart', to: 'cart#show'
end
