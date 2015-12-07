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

  attribute :form_token, String

  # Validation
  validates :title, presence: true
  validates :title, length: { maximum: 50 }
  validates :price, presence: true
  validates :price, numericality: { less_than: 999_999 }
  validates :description, presence: true
  validates :description, length: { maximum: 500 }

  validates :province, presence: true
  validates :city, presence: true
  validates :district, presence: true

  validates :address, length: { maximum: 100 }

  validates :category_id, presence: true
  validates :brand_id, presence: true

  validates :delivery_method, inclusion:
            {
              in: [Delivery::EXPRESS, Delivery::COD, Delivery::FREE, Delivery::F2F],
              message: '请选择一种快递方式'
            }
  validates :price_in_province, numericality: { less_than: 999 }, allow_blank: true
  validates :price_out_province, numericality: { less_than: 999 }, allow_blank: true

  validates :store_name, presence: true, allow_blank: true

  validate :max_tag_size

  def initialize(params = nil, form_token = nil)
    super(params)
    self.form_token = form_token
  end

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

  def max_tag_size
    messages = []

    messages << "最多10个标签" if tag_list.count > 10

    tag_list.each do |tag|
      messages << "#{tag} 长度超过6个字" if tag.length > 6
    end

    errors[:tag_list] = messages.join(',') unless messages.empty?
  end

  def persist!
    ActiveRecord::Base.transaction do
      product = Product.create(attributes.slice(:title, :quality, :price, :description,
                                                :taobao_url, :category_id, :brand_id, :tag_list))

      product.create_product_location(attributes.slice(:province, :city, :district, :address))

      product.create_delivery(method: delivery_method, price_in_province: price_in_province,
                              price_out_province: price_out_province)

      ProductImage.where(form_token: form_token).update_all(product_id: product.id)

      product.preview!
    end
  end
end
