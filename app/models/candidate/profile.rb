class Candidate::Profile < ActiveRecord::Base
  self.table_name = "candidate_profiles"

  belongs_to :candidate
  acts_as_taggable_on :skills

  def email
    Candidate.find(self.candidate_id).email
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
