class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :jobs, :through => :categorizations

  validates :title, :presence => true, :uniqueness => :true
end
