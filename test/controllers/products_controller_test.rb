require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    sign_in users(:bing)
  end

  test "should get new" do
    get :new
    assert_response :success
  end
end
