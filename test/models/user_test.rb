require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#set_slug" do
    user = users(:bing)

    user.set_slug

    assert_equal "y751qzm", user.slug
  end

  test "#set_name_with_email" do
    user = User.create(email: 'test_user@gmail.com', password: '12345678')
    user.set_name_with_email

    assert_equal "test_user", user.profile.name
  end
end
