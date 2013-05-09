class Job < ActiveRecord::Base
  belongs_to :employer
  has_many :applications

  self.per_page = 10
end
