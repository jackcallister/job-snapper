class Job < ActiveRecord::Base
  belongs_to :employer
  has_many :categorizations
  has_many :categories, :through => :categorizations
  has_many :applications

  self.per_page = 10

  TYPE = [
    ["Full time", 1],
    ["Part time", 2],
    ["Casual", 3],
    ["Contract", 4],
    ["One off", 5]
  ]

  def default_pay_rate_min
    self.pay_rate_min ||= 16
  end

  def default_pay_rate_max
    self.pay_rate_max ||= 21
  end
end
