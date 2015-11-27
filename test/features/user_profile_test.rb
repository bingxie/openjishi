require 'test_helper'
require_relative './modules/user_authentication'

class UserProfileTest < ActionDispatch::IntegrationTest
  include Modules::UserAuthentication

  setup do
    @user = users(:bing)
    login_as(@user, :scope => :user)

    Capybara.current_driver = :poltergeist
    visit user_setting_path(@user.slug)
  end

  teardown do
    Warden.test_reset!
  end

  test 'user can change password' do
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

  test 'user can change name and city' do
    assert_content '帐号设置'

    within '#edit_profile_info' do
      fill_in 'profile[name]', with: 'new name'

      find("#profile_province_id").select("山东省")
      find("#profile_city_id").select("威海市")
      find("#profile_district_id").select("环翠区")

      click_button '保存修改'
    end

    assert_equal find_field('profile[name]').value, 'new name'
    assert_equal find('#profile_province_id').value, '370000'
    assert_equal find('#profile_city_id').value, '371000'
    assert_equal find('#profile_district_id').value, '371002'
  end
end
