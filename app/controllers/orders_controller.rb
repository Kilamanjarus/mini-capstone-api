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
    #determine subtotal
    subtotal = 0
    current_user.carted_products.each do |carted_product|
      if carted_product.status == "carted"
        subtotal = subtotal + (carted_product.quantity * Product.find_by(id: carted_product.product_id).price)
      end
    end
    p subtotal
    #set created_order subtotal, tax, and total
    #create new order
    cartorder = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: subtotal * 0.05,
      total: subtotal + subtotal * 0.05,
    )
    cartorder.save!
    p cartorder
    p "#################################"
    #use new order_id to set
    current_user.carted_products.each do |carted_product|
      if carted_product.status == "carted"
        carted_product.status = "purchased"
        carted_product.order_id = cartorder.id
        carted_product.save
      end
    end

    render json: cartorder.as_json
  end
end
