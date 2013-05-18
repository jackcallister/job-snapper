class Job < ActiveRecord::Base
  include Addressify
  include Skillable

  before_create :set_positions_available

  belongs_to :employer
  has_many :applications, :dependent => :destroy
  has_one :categorization
  has_one :category, :through => :categorization
  has_one :classification
  has_one :type, :through => :classification

  validates_presence_of :title, :message => "Please include a title"
  validates_presence_of :contact_name, :message => "Please include a contact name"

  validates_presence_of :region_id, :message => "Please include location"
  validates_presence_of :type_id, :message => "Please include a job type"
  validates_presence_of :category_id, :message => "Please include a job category"

  validates_presence_of :positions, :message => "Please include the number of positions"
  validates_numericality_of :positions, :message => "You must use a numeral"

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

  private

    def set_positions_available
      self.positions_available = self.positions
    end
end
