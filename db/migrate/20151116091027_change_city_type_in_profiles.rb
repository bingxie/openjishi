class ChangeCityTypeInProfiles < ActiveRecord::Migration
  def change
    change_column :profiles, :city_id, :string
  end
end
