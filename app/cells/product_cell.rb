class ProductCell < Cell::ViewModel
  include Cell::Slim

  include ActionView::Helpers::DateHelper
  include Rails::Timeago::Helper

  property :description

  def breadcrumbs
    render
  end

  def preview_notice
    render
  end

  def publish_success
    render
  end

  def title_line
    render
  end

  def image_panel
    @product_images = model.product_images
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
end
