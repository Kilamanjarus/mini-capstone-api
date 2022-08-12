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
    current_user.carted_products.each do |cart_product|
      if cart_product.status == "carted"
        subtotal = subtotal + (cart_product.quantity * Product.find_by(id: cart_product.product_id).price)
      end
    end

    #create new order
    p cartorder = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: subtotal * 0.05,
      total: subtotal + subtotal * 0.05,
    )
    cartorder.save

    #use new order_id to set
    current_user.carted_products.each do |cart_product|
      if cart_product.status == "carted"
        cart_product.status = "purchased"
        cart_product.order_id = Order.last.id
        cart_product.save
      end
    end

    render json: current_user.carted_products.as_json
  end
end
