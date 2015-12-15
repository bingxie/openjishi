class Delivery < ActiveRecord::Base
  EXPRESS = 'express'
  COD = 'cod'
  FREE = 'free'
  F2F = 'f2f'

  DELIVERY_NAMES = { 'express': '快递', 'cod': '买家到付', 'free': '免运费', 'f2f': '仅限本地交易' }

  belongs_to :product
end
