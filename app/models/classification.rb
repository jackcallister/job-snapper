class Classification < ActiveRecord::Base
  belongs_to :job
  belongs_to :type
end
