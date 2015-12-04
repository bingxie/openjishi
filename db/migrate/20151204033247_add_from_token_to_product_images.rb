class AddFromTokenToProductImages < ActiveRecord::Migration
  def change
    add_column :product_images, :form_token, :string
  end
end
