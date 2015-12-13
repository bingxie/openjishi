class ProductCell < Cell::ViewModel
  include Cell::Slim

  include ActionView::Helpers::DateHelper
  include Rails::Timeago::Helper

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
    @test = 'test123'
    render
  end

  def description_panel
    render
  end

  def seller_info
    render
  end

  private

end
