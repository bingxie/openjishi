class ProductDecorator < Draper::Decorator
  delegate_all

  delegate :name, to: :brand, prefix: true

  def parent_category_name
    category.parent.name
  end

  def sub_category_name
    category.name
  end

  # def brand_name
  #   brand.name
  # end

  def price
    if model.price.to_f == model.price.to_i
      model.price.to_i.to_s
    else
      model.price.to_f.to_s
    end
  end

  def location_provice
    ChinaCity.get(product_location.province)
  end

  def location_city
    city = ChinaCity.get(product_location.city)
    if city == "市辖区" || city == "县"
      ChinaCity.get(product_location.district)
    else
      city
    end
  end

  def quality
    qualities = Product::QUALITIES.invert
    qualities[model.quality.to_sym]
  end

  def delivery_method
    Delivery::DELIVERY_NAMES[delivery.method.to_sym]
  end
end
