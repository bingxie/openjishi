module Modules
  module UserAuthentication
    def login_user_with_password(user, password)
      visit new_user_session_path

      assert_content '使用已有帐号登录'

      within '#new_user' do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: password

        click_button '登录'
      end

      assert_content user.profile.name

      assert_equal root_path, page.current_path
    end
  end
end
