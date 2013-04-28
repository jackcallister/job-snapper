class Application < ActiveRecord::Base
  belongs_to :job
  has_one :candidate
end
