class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
    # render json: { message: "HELLO" }
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product.as_json(methods: [:friendly_created_at])
  end

  def create
    # p params[:title]
    product = Product.new(
      title: params[:name],
      description: params[:description],
      price: params[:price],
      image_url: params[:image_url],
    )
    product.save
    # render json: { message: "Good job, saved!" }
  end

  def update
    # product = Product.find_by(id: 7)
    product = Product.find_by(id: params[:id])
    product.title = params[:title] || product.title
    product.description = params[:description] || product.description
    product.price = params[:price] || product.price
    product.image_url = params[:image_url] || product.image_url
    product.save
    render json: product.as_json
    # render json: { message: "Nice!" }
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.delete
    # render json: { message: "Goodbye data!" }
  end
end
