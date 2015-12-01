class ProductForm
  include Virtus.model
  include ActiveModel::Model

  # delegate :method, :notes, to: :delivery, prefix: true
  # delegate :province, :city, :district, :address, to: :location

  attr_accessor :parent_category

  attribute :title, String
  attribute :quality, String
  attribute :category_id, Integer
  attribute :brand_id, Integer
  attribute :price, Decimal
  attribute :description, String
  attribute :taobao_url, String

  attribute :province, String
  attribute :city, String
  attribute :district, String
  attribute :address, String

  attribute :delivery_method, String
  attribute :delivery_notes, String

  # Validation
  validates :title, presence: true
  validates :category_id, presence: true
  validates :brand_id, presence: true

  validates :delivery_notes, presence: true

  # def delivery
  #   @delivery ||=@product.build_delivery
  # end

  # def location
  #   @location ||=@product.build_product_location
  # end

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
    binding.pry
    ActiveRecord::Base.transaction do
      product = Product.create(self.attributes.slice(:title, :quality, :price, :description, :taobao_url, :category_id, :brand_id))
      product.create_product_location(self.attributes.slice(:province, :city, :district, :address))
      product.create_delivery(method: delivery_method, notes: delivery_notes)
    end
  end
end
