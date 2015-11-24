require 'test_helper'

class UserAuthenticationTest < ActionDispatch::IntegrationTest
  setup do
    ActionMailer::Base.deliveries.clear
    Capybara.reset_sessions!
  end

  test 'user can sign up with email and password' do
    visit new_user_registration_path

    assert_content "注册帐号"

    within '#new_user' do
      fill_in 'user[email]', with: 'test_user@gmail.com'
      fill_in 'user[password]', with: 'abcd1234'

      click_button '创建新帐号'
    end

    assert_equal sign_up_success_path, page.current_path

    assert_content "test_user@gmail.com"

    test_confirm_email

  end

  test 'user can sign in with email and password' do
    visit new_user_session_path

    assert_content '使用已有帐号登录'

    user = users(:bing)

    within '#new_user' do
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: '12345678'

      click_button '登录'
    end

    assert_content user.name

    assert_equal root_path, page.current_path
  end

  test 'user can find password by email address' do
    Capybara.current_driver = :poltergeist
    user = users(:bing)

    visit new_user_password_path

    assert_content '找回密码'

    within '#new_user' do
      fill_in 'user[email]', with: user.email

      click_button '发送重设密码链接到我邮箱'
    end

    wait_for_ajax

    reset_email = ActionMailer::Base.deliveries.last

    assert_equal ["support@guangchuan.com"], reset_email.from
    assert_equal [user.email], reset_email.to
    assert_equal '重置密码信息', reset_email.subject
    assert_match /Change my password/, reset_email.body.to_s

    visit URI.extract(reset_email.body.to_s).first

    assert_content '重设密码'

    within '#reset_password' do
      fill_in 'user[password]', with: '87654321'
      fill_in 'user[password_confirmation]', with: '87654321'

      click_button '确定'
    end

    assert_content user.name

    assert_equal root_path, page.current_path
  end

  private

  def test_confirm_email
    assert_not ActionMailer::Base.deliveries.empty?

    cf_email = ActionMailer::Base.deliveries.last

    assert_equal ["support@guangchuan.com"], cf_email.from
    assert_equal ['test_user@gmail.com'], cf_email.to
    assert_equal '确认信息', cf_email.subject
    assert_match /Confirm my account/, cf_email.body.to_s
  end
end
