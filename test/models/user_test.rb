require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#set_slug" do
    bing = users(:bing)

    bing.set_slug

    assert_equal "y751qzm-xie-xiao-bing", bing.slug
  end
end
