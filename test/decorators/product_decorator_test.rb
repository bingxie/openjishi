require 'test_helper'

class ProductDecoratorTest < Draper::TestCase
  setup do
    @product1 = products(:one).decorate
    @product2 = products(:two).decorate
  end

  test 'quality' do
    assert_equal "较新", @product1.quality.to_s
  end

  test 'delivery_method' do
    assert_equal "快递", @product1.delivery_method
  end

  test 'price' do
    assert_equal "10", @product1.price

    assert_equal "19.99", @product2.price
  end

  test 'location_city' do
    assert_equal "石家庄市", @product1.location_city
    assert_equal "万州区", @product2.location_city
  end
end
