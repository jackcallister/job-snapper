class AddStarToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :star, :boolean, :default => false
  end
end
