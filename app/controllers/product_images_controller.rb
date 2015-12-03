class ProductImagesController < ApplicationController
  def index
    @images = ProductImage.all
    @image = ProductImage.new
  end

  def create
    @image = ProductImage.new(image_params)

    if @image.save
      render json: { message: "success", fileID: @image.id }, status: 200
    else
      render json: { error: @image.errors.full_messages.join(',')}, status: 400
    end
  end

  def destroy
    # TODO check current user
    ProductImage.destroy(params[:id])
    render json: { message: "success"}, status: 200
  end

  private

  def image_params
    params.require(:product_image).permit(:image)
  end
end
