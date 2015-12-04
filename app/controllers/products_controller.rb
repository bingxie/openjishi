class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @product_form = ProductForm.new()
  end

  def create
    @product_form = ProductForm.new(params[:product], params[:authenticity_token])


    if @product_form.store_name
      current_user.store.update_attributes(name: @product_form.store_name)
    end

    if @product_form.save
      render action: 'show'
    else
      render action: 'new'
    end
  end

  def show

  end
end
