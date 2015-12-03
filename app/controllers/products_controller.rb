class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @product_form = ProductForm.new()
  end

  def create
    @product_form = ProductForm.new(params[:product])
    @product_form.save

    if @product_form.store_name
      current_user.store.update_attributes(name: @product_form.store_name)
    end
  end

end
