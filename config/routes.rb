Rails.application.routes.draw do
  root to: "pages#home"
  resources :restaurants do
    resources :items # /restaurants/:restaurant_id/items
  end
  resources :dishes
  get "pages/home"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
