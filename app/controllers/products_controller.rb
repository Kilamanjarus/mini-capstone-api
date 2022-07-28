class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
    # render json: { message: "HELLO" }
  end

  def show
    render json: { message: "Hi" }
  end
end
