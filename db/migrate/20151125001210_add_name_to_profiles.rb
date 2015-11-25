class AddNameToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :name, :string, null: false, default: ""
  end
end
