require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  class ShowNameTest < StoreTest
    test "use user name as store name" do
      user = users(:bing)
      store = user.create_store

      assert_equal user.profile.name, store.show_name
    end

    test 'store has name' do
      user = users(:bing)
      store = user.create_store(name: "My Camera")
      assert_equal 'My Camera', store.show_name
    end
  end
end
