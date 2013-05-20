class RemoveJobForeignKeys < ActiveRecord::Migration
  def up
    remove_column :jobs, :type_id
    remove_column :jobs, :category_id
  end

  def down
    add_column :jobs, :type_id, :integer
    add_column :jobs, :category_id, :integer
  end
end
