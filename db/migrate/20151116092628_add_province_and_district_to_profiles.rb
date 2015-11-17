class AddProvinceAndDistrictToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :province_id, :string
    add_column :profiles, :district_id, :string
  end
end
