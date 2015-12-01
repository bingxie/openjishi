class ProductForm
  include ActiveModel::Model

  attr_accessor :parent_category, :title, :category, :brand, :quality

  validates :title, presence: true
  validates :category, presence: true
  validates :brand, presence: true

  def initialize(product)
    @product = product
  end

  def submit
  end
end
