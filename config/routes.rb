Rails.application.routes.draw do
  root to: "pages#home"
  post '/restaurants/:restaurant_id/items', to: 'items#create', as: 'restaurant_items'
  patch '/restaurants/:restaurant_id/items/:id', to: 'items#update', as: 'restaurant_item'
  resources :orders
  resources :restaurants do
    resources :items do
      resources :orders
    end
    patch '/items', to: 'items#update', as: 'update_items'
  end
  resources :dishes
  get "pages/home"
  resources :items do
    resources :orders
  end
  resources :orders do
    resources :order_items, only: [:create]
  end
end


