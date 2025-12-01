Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)

  root 'products#index'

  resources :products, only: [:index, :show]
  resource :cart, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]
  resources :orders, only: [:new, :create, :show, :index]

  get '/pages/:slug', to: 'pages#show', as: :page
end