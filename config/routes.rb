Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #2 routes, shows 1 product, shows all products

  get "/all_products", controller: "products", action: "show_all_products"

  get "/banana", controller: "products", action: "get_info_banana"

  # Defines the root path route ("/")
  # root "articles#index"
end
