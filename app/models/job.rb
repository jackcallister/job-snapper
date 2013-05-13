class Job < ActiveRecord::Base
  belongs_to :employer
  belongs_to :region
  belongs_to :city
  has_many :applications
  has_one :categorization
  has_one :category, :through => :categorization
  has_one :classification
  has_one :type, :through => :classification

  acts_as_taggable_on :skills

  validates_presence_of :title
  validates_presence_of :company
  validates_presence_of :contact_name

  validates_presence_of :region_id
  validates_presence_of :city_id
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

  def address
    "#{region.name}, #{city.name}"
  end

  def work_type
    "#{type.title}"
  end
end
