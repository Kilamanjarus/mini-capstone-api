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

  def create
    product = Product.new(
      title: "Carrot",
      description: "A orange vegetable",
      price: 1,
      image_url: "google.com",
    )
    product.save
    render json: { message: "Good job, saved!" }
  end
end
