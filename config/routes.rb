Rails.application.routes.draw do
  get "/products" => "products#index" #everyone
  get "/products/:id" => "products#show" #everyone
  post "/products" => "products#create" #admin
  patch "/products/:id" => "products#update" #admin
  delete "/products/:id" => "products#destroy" #admin

  get "/suppliers" => "suppliers#index" #everyone

  post "/images" => "images#create" #admin

  post "/users" => "users#create" #everyone
  post "/sessions" => "sessions#create" #everyone

  get "/orders" => "orders#index" #user
  get "/orders/:id" => "orders#show" #user
  post "/orders" => "orders#create" #user

  get "/carted_products" => "carted_products#index"
  post "/carted_products" => "carted_products#create"
  delete "/carted_products/:id" => "carted_products#destroy"
end
