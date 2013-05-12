class AddRegionIdToCities < ActiveRecord::Migration
  def change
    add_column :cities, :region_id, :integer
  end
end
