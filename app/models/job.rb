class Job < ActiveRecord::Base
  include Addressable

  belongs_to :employer

  has_many :applications

  has_one :categorization
  has_one :category, :through => :categorization

  has_one :classification
  has_one :type, :through => :classification

  has_one :region
  has_one :city

  self.per_page = 10

  def default_pay_rate_min
    self.pay_rate_min ||= 16
  end

  def default_pay_rate_max
    self.pay_rate_max ||= 21
  end

  def region
    Region.find(self.region_id).name
  end

  def city
    City.find(self.city_id).name
  end
end
