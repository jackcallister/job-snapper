class Region < ActiveRecord::Base
  has_many :cities
  validates :name, :uniqueness => true, :presence => true
end
