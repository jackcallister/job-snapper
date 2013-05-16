class Candidate::Profile < ActiveRecord::Base
  include Addressify
  include Skillable

  self.table_name = "candidate_profiles"

  belongs_to :candidate

  validates_presence_of :name,
                        :message => "No one likes a person with no name!"
  validates_presence_of :contact_number,
                        :message => "Employers need a contact number to be able to contact you."
  validates :contact_number, :length => { :minimum => 5 }
  validates_presence_of :previous_work_experience,
                        :message => "Make it easy for employers to pick you, fill in your previous work experience."
  validates_presence_of :region_id

  def email
    Candidate.find(self.candidate_id).email
  end
end
