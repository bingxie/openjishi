class Product < ActiveRecord::Base
  QUALITIES = { "全新": :new100, "极新": :new95, "较新": :new90, "良好": :new80, "一般": :new70 }

  include AASM

  acts_as_taggable

  belongs_to :category
  belongs_to :brand

  has_one :product_location
  has_one :delivery

  has_many :product_images

  aasm no_direct_assignment: true do
    state :preview, initial: true
    state :published

    event :publish do
      transitions :from => :preview, :to => :published
    end
  end
end
