class CreateCandidateProfile < ActiveRecord::Migration
  def change
    create_table(:candidate_profiles) do |t|
      t.belongs_to :candidate
    end
  end
end
