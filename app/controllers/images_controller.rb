class ImagesController < ApplicationController
  before_action :authenticate_admin

  def create
    image = Image.new(
      url: params[:url],
      product_id: params[:product_id],
    )
    image.save
    render json: image.as_json
    # render json: { message: "habbits" }
  end
end
