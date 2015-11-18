require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#set_slug" do
    bing = users(:bing)

    bing.send :set_slug

    assert_equal "y751qzm", bing.slug
  end
end
