class Category < ActiveRecord::Base
  has_ancestry

  has_many :brand_categories
  has_many :brands, through: :brand_categories
end
