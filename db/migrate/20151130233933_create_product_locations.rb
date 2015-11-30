class CreateProductLocations < ActiveRecord::Migration
  def change
    create_table :product_locations do |t|
      t.references :product, index: true, foreign_key: true
      t.string :city
      t.string :provice
      t.string :district
      t.string :address

      t.timestamps null: false
    end
  end
end
