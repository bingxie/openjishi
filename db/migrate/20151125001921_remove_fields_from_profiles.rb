class RemoveFieldsFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :mobile, :string
    remove_column :profiles, :introduction, :text
    remove_column :profiles, :qq, :string
    remove_column :profiles, :wechat, :string
  end
end
