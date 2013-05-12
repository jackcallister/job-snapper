class Type < ActiveRecord::Base
  has_many :classifications
  has_many :jobs, :through => :classifications
end
