require 'test_helper'

class LayoutTest < ActionDispatch::IntegrationTest
  test 'home page with index layout' do
    visit("/")

    assert_content "Sign Up"

    assert page.has_selector?("html>head+body")

    assert_match /镜影汇 - static/, page.title
  end
end
