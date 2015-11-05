require 'test_helper'

class SecretControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get show" do
    sign_in users(:bing)

    get :show
    assert_response :success
  end

  test "not authenticated should get redirect" do
    get :show
    assert_response :redirect
  end

end
