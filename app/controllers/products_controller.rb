class ProductsController < ApplicationController
  def get_info_id
    product = Product.find_by id: params["id"]
    render json: product.as_json
  end

  def show_all_products
    products = Product.all
    render json: products.as_json
  end
end
