Rails.application.routes.draw do
  resources :order_details
  resources :orders
  resources :menu_categories
  resources :menu_items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post '/tambah-menu-item', to: 'menu_items#tambahMenuItem'
  post '/tambah-menu-category', to: 'menu_categories#tambahMenuCategory'

  patch '/update-menu-item/:id', to: 'menu_items#updateMenuItem'
  
  # Defines the root path route ("/")
  # root "articles#index"
end
