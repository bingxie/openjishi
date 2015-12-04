class Product < ActiveRecord::Base
  QUALITIES = { '全新': :new100 , '九成新': :new90, '八成新': :new80 }

  acts_as_taggable

  belongs_to :category
  belongs_to :brand

  has_one :product_location
  has_one :delivery

  has_many :product_images
end
