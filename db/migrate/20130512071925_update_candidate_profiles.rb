class UpdateCandidateProfiles < ActiveRecord::Migration
  def up
    add_column :candidate_profiles, :region_id, :integer
    add_column :candidate_profiles, :city_id, :integer
    remove_column :candidate_profiles, :address
    remove_column :candidate_profiles, :region
    remove_column :candidate_profiles, :city_or_town
  end

  def down
    remove_column :candidate_profiles, :region_id
    remove_column :candidate_profiles, :city_id
    add_column :candidate_profiles, :address, :string
    add_column :candidate_profiles, :region, :string
    add_column :candidate_profiles, :city_or_town, :string
  end
end
