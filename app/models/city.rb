class City < ActiveRecord::Base
  belongs_to :region
  default_scope :order => :name
  validates :name, :presence => true, :uniqueness => true
end
