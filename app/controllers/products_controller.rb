class ProductsController < ApplicationController
  def new
    @product_form = ProductForm.new()
  end

  def create
    @product_form = ProductForm.new(params[:product])
    @product_form.save
  end

  def show
  end

  def edit
  end

  def update
  end
end