class ProductsController < ApplicationController
  def new
    product = Product.new
    @product_form = ProductForm.new(product)
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end
end
