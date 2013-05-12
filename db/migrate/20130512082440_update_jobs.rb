class UpdateJobs < ActiveRecord::Migration
  def up
    remove_column :jobs, :address_id
    add_column :jobs, :region_id, :integer
    add_column :jobs, :city_id, :integer
  end

  def down
    add_column :jobs, :address_id, :integer
    remove_column :jobs, :region_id
    remove_column :jobs, :city_id
  end
end
