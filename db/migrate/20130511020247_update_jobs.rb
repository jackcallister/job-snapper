class UpdateJobs < ActiveRecord::Migration
  def up
    remove_column :jobs, :pay_rate_id
    add_column :jobs, :pay_rate_max, :integer
    add_column :jobs, :pay_rate_min, :integer
  end

  def down
    add_column :jobs, :pay_rate_id, :integer
    remove_column :jobs, :pay_rate_max
    remove_column :jobs, :pay_rate_min
  end
end
