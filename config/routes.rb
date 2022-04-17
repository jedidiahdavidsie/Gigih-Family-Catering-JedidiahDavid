Rails.application.routes.draw do
  resources :order_details
  resources :orders
  resources :menu_categories
  resources :menu_items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/', to: 'menu_items#index'
  post '/tambah-order', to: 'orders#tambahOrder'
  post '/tambah-menu-item', to: 'menu_items#tambahMenuItem'
  post '/tambah-menu-category', to: 'menu_categories#tambahMenuCategory'
  post '/tambah-item-pesanan', to: 'order_details#tambahItemPesanan'

  patch '/update-menu-item/:id', to: 'menu_items#updateMenuItem'
  patch '/konfirmasi-pesanan', to: 'orders#konfirmasiPesanan'
  
  # Defines the root path route ("/")
  # root "articles#index"
end
