class Candidate::Profile < ActiveRecord::Base
  self.table_name = "candidate_profiles"

  belongs_to :candidate
  acts_as_taggable_on :skills
end
