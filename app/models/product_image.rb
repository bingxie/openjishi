class ProductImage < ActiveRecord::Base
  belongs_to :product

  has_attached_file :image, styles: { large: "800x800>", medium: "400x400>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\Z}
end
