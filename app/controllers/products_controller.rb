class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  before_action :set_product, only: [:show, :preview]

  def new
    @product_form = ProductForm.new
  end

  def edit
  end

  def create
    @product_form = ProductForm.new(params[:product], params[:authenticity_token])

    if @product_form.store_name
      current_user.store.update_attributes(name: @product_form.store_name)
    end

    if product = @product_form.save
      redirect_to preview_product_path(product)
    else
      render action: :new
    end
  end

  def show
  end

  def preview
    redirect_to @product if @product.published?
  end

  def publish
    product = Product.find(params[:id])

    if product.publish!
      flash[:product_publish_success] = "success"
      redirect_to product
    end
  end

  def to_taobao
    product = Product.find(params[:id])
    redirect_to product.taobao_url, status: 302
  end

  private

  def set_product
    @product = Product.includes(:delivery).includes(:product_location).find(params[:id]).decorate
  end
end
