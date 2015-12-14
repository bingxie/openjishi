require 'test_helper'

class ProductDecoratorTest < Draper::TestCase
  setup do
    @product = products(:one).decorate
  end

  test 'quality' do
    assert_equal "较新", @product.quality.to_s
  end

  test 'delivery_method' do
    assert_equal "快递", @product.delivery_method
  end

  test 'price' do
    assert_equal "10", @product.price

    product2 = products(:two).decorate
    assert_equal "19.99", product2.price
  end
end
