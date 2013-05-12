class Job < ActiveRecord::Base
  # include Addressable

  belongs_to :employer
  belongs_to :region
  belongs_to :city
  has_many :applications
  has_one :categorization
  has_one :category, :through => :categorization
  has_one :classification
  has_one :type, :through => :classification

  validates_presence_of :title


  self.per_page = 10

  def default_pay_rate_min
    self.pay_rate_min ||= 16
  end

  def default_pay_rate_max
    self.pay_rate_max ||= 21
  end
end
