require 'test_helper'
require_relative './modules/user_authentication'

class UserProfileTest < ActionDispatch::IntegrationTest
  include Modules::UserAuthentication

  setup do
    @user = users(:bing)
    login_as(@user, :scope => :user)
  end

  teardown do
    Warden.test_reset!
  end

  test 'user can change password' do
    Capybara.current_driver = :poltergeist
    visit user_setting_path(@user.slug)

    assert_content '修改密码'

    within '#change_password_form' do
      fill_in 'user[current_password]', with: '12345678'
      fill_in 'user[password]', with: '87654321'
      fill_in 'user[password_confirmation]', with: '87654321'

      click_button '确定修改'
    end

    # wait_for_ajax

    # assert_content '密码修改成功'
    logout(:user)

    login_user_with_password(@user, '87654321')
  end
end
