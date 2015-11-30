class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.references :product, index: true, foreign_key: true
      t.string :method, null: false
      t.decimal :price_in_province
      t.decimal :price_out_province
      t.text :notes

      t.timestamps null: false
    end
  end
end
