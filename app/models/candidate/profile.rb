class Candidate::Profile < ActiveRecord::Base
  # include Addressable
  self.table_name = "candidate_profiles"

  belongs_to :candidate
  belongs_to :region
  belongs_to :city

  acts_as_taggable_on :skills

  def email
    Candidate.find(self.candidate_id).email
  end

  def region
    Region.find(self.region_id).name
  end

  def city
    City.find(self.city_id).name
  end
end
