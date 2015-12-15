require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    sign_in users(:bing)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:product_form)
  end

  test 'preview should redirect to show when product is published' do
    product = products(:one)
    product.preview!
    product.publish!

    get :preview, id: product

    assert_redirected_to product_path(product)
  end

  test 'should publish the product' do
    product = products(:one)
    product.preview!

    put :publish, id: product

    assert product.reload.published?

    assert_redirected_to product_path(product)
  end
end
