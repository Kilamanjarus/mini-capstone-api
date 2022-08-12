class CartedProductsController < ApplicationController
  def index
    cart_products = CartedProduct.where(status: "carted", user_id: current_user)
    #carted_products = current_user.carted_products.where(status: "carted") also works, bit more common syntax
    render json: "carted_products/index"
  end

  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
    )
    carted_product.save
    render json: carted_product.as_json
  end

  def destroy
    cart_product = CartedProduct.find_by(id: params[:id])
    cart_product.status = "removed"
    cart_product.save
    render json: { message: "Product removed from cart." }
  end
end
