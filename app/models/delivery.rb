class Delivery < ActiveRecord::Base
  EXPRESS = 'express'
  COD = 'cod'
  FREE = 'free'
  F2F = 'f2f'

  belongs_to :product
end
