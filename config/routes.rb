Rails.application.routes.draw do
  root to: "pages#home"
  post '/restaurants/:restaurant_id/items', to: 'items#create', as: 'restaurant_items'
  patch '/restaurants/:restaurant_id/items/:id', to: 'items#update', as: 'restaurant_item'
  resources :restaurants do
    resources :items, only: [:new, :create, :edit, :update]
    patch '/items', to: 'items#update', as: 'update_items'
  end
  resources :dishes
  get "pages/home"
  resources :items
end


