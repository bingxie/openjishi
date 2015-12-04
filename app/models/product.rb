class Product < ActiveRecord::Base
  QUALITIES = { "全新": :new100, "极新": :new95, "较新": :new90, "良好": :new80, "一般": :new70 }

  acts_as_taggable

  belongs_to :category
  belongs_to :brand

  has_one :product_location
  has_one :delivery

  has_many :product_images
end
