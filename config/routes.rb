Rails.application.routes.draw do
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products
  devise_for :users
  root to: "pages#home"

  get 'catering', to: 'pages#catering'
  get 'info', to: 'pages#info'
  get 'menu', to: 'menus#index'
  get 'search', to: 'menu#search'
end
