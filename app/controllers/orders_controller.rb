class OrdersController < ApplicationController
  def index
    orders = Order.all
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
      product: Product.find_by(id: params[:product_id]).name,
      quantity: params[:quantity],
      subtotal: Product.find_by(id: params[:product_id]).price,
      tax: Product.find_by(id: params[:product_id]).tax,
      total: (Product.find_by(id: params[:product_id]).tax + Product.find_by(id: params[:product_id]).price) * params[:quantity],
    )
    order.save
    render json: order.as_json
  end
end
