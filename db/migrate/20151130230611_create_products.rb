class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.decimal :price, null: false, default: 0
      t.string :quality
      t.text :description, null: false
      t.string :taobao_url
      t.references :category, index: true, foreign_key: true
      t.references :brand, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
