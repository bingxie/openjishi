class AddUserIdToProductImages < ActiveRecord::Migration
  def change
    add_column :product_images, :user_id, :integer, null: false
  end
end
