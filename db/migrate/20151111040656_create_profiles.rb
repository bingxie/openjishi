class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :city_id
      t.string :mobile
      t.text :introduction
      t.attachment :avatar
      t.string :qq
      t.string :wechat

      t.datetime :updated_at, null: false
    end
  end
end
