class Type < ActiveRecord::Base
  has_many :classifications
  has_many :jobs, :through => :classifications
  validates :title, :presence => true
end
