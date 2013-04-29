class AddPhoneNumbersToCandidateProfiles < ActiveRecord::Migration
  def change
    add_column :candidate_profiles, :phone, :string
    add_column :candidate_profiles, :mobile, :string
  end
end
