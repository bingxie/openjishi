class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name, null: false
      t.string :en_name, null: false
      t.string :slug, null: false

      t.timestamps null: false
    end

    add_index :brands, :slug, unique: true
  end
end
