class Job < ActiveRecord::Base
  include Addressify
  include Skillable

  belongs_to :employer
  has_many :applications
  has_one :categorization
  has_one :category, :through => :categorization
  has_one :classification
  has_one :type, :through => :classification

  validates_presence_of :title
  validates_presence_of :contact_name

  validates_presence_of :region_id, :message => "We need a location to find relevant candidates."
  validates_presence_of :type_id
  validates_presence_of :category_id

  validates_presence_of :summary
  validates_presence_of :description

  self.per_page = 10

  def default_pay_rate_min
    self.pay_rate_min ||= 16
  end

  def default_pay_rate_max
    self.pay_rate_max ||= 21
  end

  def default_start_date
    if start_date
      start_date.strftime('%d %b, %Y')
    else
      start_date = DateTime.now.strftime('%d %b, %Y')
    end
  end

  def formatted_pay_rate_min
    "$#{pay_rate_min}"
  end

  def formatted_pay_rate_max
    "$#{pay_rate_max}"
  end

  def work_type
    "#{type.title}"
  end
end
