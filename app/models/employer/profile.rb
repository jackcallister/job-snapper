class Employer::Profile < ActiveRecord::Base
  self.table_name = "employer_profiles"

  belongs_to :employer

  def email
    Employer.find(self.employer_id).email
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
