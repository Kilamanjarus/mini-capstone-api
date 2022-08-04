class ImagesController < ApplicationController
  def create
    image = Image.new(
      url: params[:url],
      product_id: params[:product_id],
    )
    render json: image.as_json
    # render json: { message: "habbits" }
  end
end
