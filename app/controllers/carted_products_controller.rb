class CartedProductsController < ApplicationController
  def index
    cart_products = CartedProduct.all
    render json: cart_products.as_json
  end

  def create
    carted_product = CartedProduct.new(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity],
      order_id: nil,
      status: "carted",
    )
    carted_product.save
    render json: carted_product.as_json
  end

  def destroy
    cart_product = CartedProduct.find_by(id: params[:id])
    cart_product.status = "removed"
    cart_product.save
    render json: cart_product.as_json
  end
end
