class ProductsController < ApplicationController
  def index
    p "*" * 88
    p current_user
    p "*" * 88
    @products = Product.all
    render template: "products/index"
  end

  def show
    p "*" * 88
    p current_user
    p "*" * 88
    @product = Product.find_by(id: params[:id])
    render template: "products/show"
  end

  def create
    product = Product.new(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      supplier_id: params[:supplier_id],
    )
    if product.save
      render json: product.as_json
    else
      render json: product.errors.full_messages, status: :unprocessable_entity
    end
    # render json: { message: "Good job, saved!" }
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name] || product.name
    product.description = params[:description] || product.description
    product.price = params[:price] || product.price
    product.supplier_id = params[:supplier_id] || product.supplier_id
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
