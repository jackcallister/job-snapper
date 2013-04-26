class Employer::Profile < ActiveRecord::Base
  self.table_name = "employer_profiles"

  belongs_to :employer
end
