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
    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: Product.find_by(id: params[:product_id]).price * params[:quantity],
      tax: Product.find_by(id: params[:product_id]).tax * params[:quantity],
      total: (Product.find_by(id: params[:product_id]).tax + Product.find_by(id: params[:product_id]).price) * params[:quantity],
    )
    order.save
    render json: order.as_json
  end
end
