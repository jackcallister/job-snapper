class UpdateCadidateProfiles < ActiveRecord::Migration
  def up
    remove_column :candidate_profiles, :first_name
    remove_column :candidate_profiles, :last_name
    add_column :candidate_profiles, :name, :string

    remove_column :candidate_profiles, :address_line_1
    remove_column :candidate_profiles, :address_line_2
    add_column :candidate_profiles, :address, :string

    rename_column :candidate_profiles, :information, :about_me

    remove_column :candidate_profiles, :mobile
    remove_column :candidate_profiles, :phone
    add_column :candidate_profiles, :contact_number, :string
  end

  def down
    add_column :candidate_profiles, :first_name, :string
    add_column :candidate_profiles, :last_name, :string
    remove_column :candidate_profiles, :name

    add_column :candidate_profiles, :address_line_1, :string
    add_column :candidate_profiles, :address_line_2, :string
    remove_column :candidate_profiles, :address

    rename_column :candidate_profiles, :about_me, :information

    add_column :candidate_profiles, :mobile, :string
    add_column :candidate_profiles, :phone, :string
    remove_column :candidate_profiles, :contact_number
  end
end
