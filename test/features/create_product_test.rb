require 'test_helper'

class CreateProductTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:bing)
    login_as(@user, scope: :user)

    Capybara.current_driver = :poltergeist
  end

  test 'create new product' do
    visit new_product_path

    assert_content '发布新商品'

    within '#new_product' do
      find('#product_parent_category').select("镜头")
      find('#product_category_id').select("单反镜头")
      find('#product_brand_id').select("尼康")

      fill_in 'product[title]', with: '97新 CONTAX 康泰时 60 2.8 AEG 德产 带原装皮套 YC口'
      fill_in 'product[price]', with: 3688
      find('#product_quality').select('较新')
      fill_in 'product[taobao_url]', with: 'https://2.taobao.com/item.htm?id=524312732219&spm=686.1000925.0.0.Leli5e'

      fill_in 'product[description]', with: FFaker::LoremCN.paragraph(10)
      # find(:xpath, "//input[@name='product[tag_list][]']").set "尼康,单反镜头,nikon,镜头"

      find("#product_province").select("山东省")
      find("#product_city").select("威海市")
      find("#product_district").select("环翠区")

      fill_in 'product[address]', with: '山东省威海市高技区沈阳中路51号'

      find(:xpath, "//input[@id='product_delivery_method_express']").set 'true'

      assert_content '快递费用'
      fill_in 'product[price_in_province]', with: 10
      fill_in 'product[price_out_province]', with: 20

      click_button '预览商品'

      new_product = Product.last

      assert_equal preview_product_path(new_product), page.current_path

      assert_equal new_product.price, 3688
      assert_equal new_product.product_location.province, '370000'
      assert_equal new_product.delivery.method, 'express'
      assert_equal new_product.delivery.price_in_province, 10

      assert_equal new_product.store_id, @user.store.id
      assert_equal new_product.preview?, true
    end
  end
end
