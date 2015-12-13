class ProductDecorator < Draper::Decorator
  delegate_all

  def parent_category_name
    category.parent.name
  end

  def sub_category_name
    category.name
  end

  def brand_name
    brand.name
  end

  def price
    model.price.to_i
  end

  def location_provice
    ChinaCity.get(product_location.province)
  end

  def location_city
    ChinaCity.get(product_location.city)
  end

  def quality
    qualities = Product::QUALITIES.invert
    qualities[model.quality.to_sym]
  end
end
