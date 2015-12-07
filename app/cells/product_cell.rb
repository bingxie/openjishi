class ProductCell < Cell::ViewModel
  include Cell::Slim

  property :description

  def breadcrumbs
    render
  end

  def preview_notice
    if model.preview?
      render 'preview_notice'
    elsif model.published?
      render 'publish_success'
    end
  end

  def title_line
    render
  end

  def image_panel
    render
  end

  def info_panel
    render
  end

  def description_panel
    render
  end

  def seller_info
    render
  end

  private

  def parent_category_name
    model.category.parent.name
  end

  def sub_category_name
    model.category.name
  end

  def brand_name
    model.brand.name
  end

  def title
    model.title
  end
end
