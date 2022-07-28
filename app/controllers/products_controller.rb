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
    # p params[:title]
    product = Product.new(
      title: params[:title],
      description: params[:description],
      price: params[:price],
      image_url: params[:image_url],
    )
    product.save
    # render json: { message: "Good job, saved!" }
  end

  def update
    product = Product.find_by(id: 7)
    # product = Product.find_by(id: params[:id])
    product.title = "Orange"
    product.description = "An orange fruit"
    product.price = 3
    product.save
    render json: product.as_json
    # render json: { message: "Nice!" }
  end
end
