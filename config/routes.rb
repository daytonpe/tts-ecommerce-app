Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'storefront#all_items'

  post 'add_to_cart' => 'cart#add_to_cart'
  post 'order_complete' => 'cart#order_complete'
  get 'view_order' => 'cart#view_order'
  get 'checkout' => 'cart#checkout'
  delete 'clear_cart' => 'cart#clear_cart'

  resources :line_items
  resources :orders
  devise_for :users

  get 'all' => 'storefront#all_items'
  get 'categorical' => 'storefront#items_by_category'
  get 'branding' => 'storefront#items_by_brand'

  resources :products
  resources :categories


end


