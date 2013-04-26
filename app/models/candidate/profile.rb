class Candidate::Profile < ActiveRecord::Base
  self.table_name = "candidate_profiles"

  belongs_to :candidate
end
