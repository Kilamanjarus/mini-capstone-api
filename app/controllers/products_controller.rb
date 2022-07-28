class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
    # render json: { message: "HELLO" }
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product.as_json
  end
end
