Rails.application.routes.draw do
  resources :order_details
  resources :orders
  resources :menu_categories
  resources :menu_items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
