class Job < ActiveRecord::Base
  belongs_to :employer
  has_many :applications
end
