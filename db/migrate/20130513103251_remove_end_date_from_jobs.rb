class RemoveEndDateFromJobs < ActiveRecord::Migration
  def up
    remove_column :jobs, :end_date
  end

  def down
    remove_column :jobs, :end_date, :datetime
  end
end
