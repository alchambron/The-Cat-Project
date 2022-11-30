Rails.application.routes.draw do
  get 'cart/list_items'
  get 'cart/add_item'
  get 'cart/delete_item'
  resources :orders
  resources :carts
  resources :items
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
