class Product < ActiveRecord::Base
  QUALITIES = { '全新': :new100 , '九成新': :new90, '八成新': :new80 }

  belongs_to :category
  belongs_to :brand

end
