class CategoriesController < ApplicationController
  include CategoryHelper

  def show
    if params[:parent_category_id]
      parent_category = Category.find(params[:parent_category_id])
      @options = sub_category_options(parent_category)
    elsif params[:category_id]
      category = Category.find(params[:category_id])
      @options = brand_options(category)
    end
    render partial: 'options', laytou: false
  end
end
