class AddFieldsToCandidateProfiles < ActiveRecord::Migration
  def change
    add_column :candidate_profiles, :first_name, :string
    add_column :candidate_profiles, :last_name, :string
    add_column :candidate_profiles, :age, :integer
    add_column :candidate_profiles, :address_line_1, :string
    add_column :candidate_profiles, :address_line_2, :string
    add_column :candidate_profiles, :region, :string
    add_column :candidate_profiles, :city_or_town, :string
    add_column :candidate_profiles, :information, :text
    add_column :candidate_profiles, :previous_work_experience, :text
  end
end
