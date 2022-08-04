class SuppliersController < ApplicationController
  def index
    render json: Supplier.all
    # render json: { message: "Nice!" }
  end
end
