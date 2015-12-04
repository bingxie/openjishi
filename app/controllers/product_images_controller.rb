class ProductImagesController < ApplicationController
  def index
    @images = ProductImage.all
    @image = ProductImage.new
  end

  def create
    image = ProductImage.new(image_params)
    image.user_id = current_user.id
    image.form_token = params[:authenticity_token]


    if image.save
      render json: { message: "success", fileID: image.id }, status: 200
    else
      render json: { error: image.errors.full_messages.join(',')}, status: 400
    end
  end

  def destroy
    image = ProductImage.find(params[:id])
    if image && image.user_id == current_user.id
      ProductImage.destroy(params[:id])
      render json: { message: "success"}, status: 200
    else
      render json: { error: "not owner"}, status: 400
    end
  end

  private

  def image_params
    params.require(:product_image).permit(:image)
  end
end
