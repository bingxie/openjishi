class ProductForm
  include Virtus.model
  include ActiveModel::Model

  attr_accessor :parent_category

  attribute :title, String
  attribute :quality, String
  attribute :category_id, Integer
  attribute :brand_id, Integer
  attribute :price, Decimal
  attribute :description, String
  attribute :taobao_url, String
  attribute :tag_list, String

  attribute :province, String
  attribute :city, String
  attribute :district, String
  attribute :address, String

  attribute :delivery_method, String

  attribute :price_in_province, Decimal
  attribute :price_out_province, Decimal

  attribute :store_name, String


  # Validation
  validates :title, presence: true
  validates :title, length: { maximum: 50 }
  validates :price, presence: true
  validates :price, numericality: { less_than: 999999 }
  validates :description, presence: true
  validates :description, length: { maximum: 500 }

  validates :province, presence: true
  validates :city, presence: true
  validates :district, presence: true

  validates :address, length: { maximum: 100 }

  validates :category_id, presence: true
  validates :brand_id, presence: true

  validates :delivery_method, :inclusion => { :in => [Delivery::EXPRESS, Delivery::COD, Delivery::FREE, Delivery::F2F] }
  validates :price_in_province, numericality: { less_than: 999 }
  validates :price_out_province, numericality: { less_than: 999 }

  validates :store_name, presence: true

  def self.model_name
    ActiveModel::Name.new(self, nil, "Product")
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

  def persist!
    ActiveRecord::Base.transaction do
      product = Product.create(self.attributes.slice(:title, :quality, :price, :description, :taobao_url, :category_id, :brand_id, :tag_list))

      product.create_product_location(self.attributes.slice(:province, :city, :district, :address))

      product.create_delivery(method: delivery_method, price_in_province: price_in_province, price_out_province: price_out_province)
    end
  end
end
