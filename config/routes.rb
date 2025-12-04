Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :products, only: [:index, :show]

  resource :cart, only: [:show] do
  post "add_item", to: "carts#add_item"
  post "update_item", to: "carts#update_item"
  delete "remove_item", to: "carts#remove_item"
  delete "clear", to: "carts#clear"
end


  resources :orders, only: [:index, :show]

  # 👇 Make this your homepage
  root "home#index"
end
