Rails.application.routes.draw do
  root 'items#index'
  scope '/cart' do
    get 'users/show', to: 'users#show'
  get 'list_items', to: 'cart#list_items', as: 'cart_list_items'
    post 'add_item/:id', to: 'cart#add_item', as: 'cart_add_item'
    delete 'delete_item/:id', to: 'cart#delete_item', as: 'cart_delete_item'
  end
  resources :orders
  resources :carts
  resources :items
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end
end
