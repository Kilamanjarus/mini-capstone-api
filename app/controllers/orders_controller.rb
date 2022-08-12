class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    orders = current_user.orders
    render json: orders.as_json
  end

  def show
    order = Order.find_by(id: params[:id])
    render json: order.as_json
  end

  def create
    cart = []
    cart << current_user.carted_products
    p cart
    # order = Order.new(
    #   user_id: current_user.id,
    #   subtotal: Product.find_by(id: params[:product_id]).price * params[:quantity],
    #   tax: Product.find_by(id: params[:product_id]).tax * params[:quantity],
    #   total: (Product.find_by(id: params[:product_id]).tax + Product.find_by(id: params[:product_id]).price) * params[:quantity],
    # )
    # order.save

    render json: cart.as_json
  end
end
