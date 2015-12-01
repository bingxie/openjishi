class ProductForm
  include Virtus.model
  include ActiveModel::Model

  attr_accessor :parent_category

  attribute :title, String
  attribute :quality, String
  attribute :category, Integer
  attribute :brand, Integer
  attribute :price, Decimal
  attribute :description, String

  attribute :province, String
  attribute :city, String
  attribute :district, String
  attribute :address, String

  attribute :delivery_method, String
  attribute :delivery_notes, String


  validates :title, presence: true
  validates :category, presence: true
  validates :brand, presence: true

  def initialize(product)
    @product = product
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, "Product")
  end

  def submit
  end
end
