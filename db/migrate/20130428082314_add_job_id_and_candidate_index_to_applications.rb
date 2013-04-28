class AddJobIdAndCandidateIndexToApplications < ActiveRecord::Migration
  def change
    add_index :applications, [:job_id, :candidate_id], :unique => true
  end
end
