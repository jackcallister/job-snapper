class AddPositionsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :positions, :integer
    add_column :jobs, :positions_available, :integer
  end
end
