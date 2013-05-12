class AddFieldsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :summary, :text
    add_column :jobs, :description, :text
    add_column :jobs, :ideal_candidate, :text
    add_column :jobs, :region_id, :integer
    add_column :jobs, :city_id, :integer
    add_column :jobs, :contact_name, :string
    add_column :jobs, :contact_number, :string
    add_column :jobs, :application_instructions, :text
  end
end
