class ProductsController < ApplicationController
  def get_info_banana
    product = Product.find_by title: "Banana"
    render json: product.as_json
  end

  def show_all_products
    products = Product.all
    render json: products.as_json
  end
end
