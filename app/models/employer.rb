class Employer < User
  has_one :user, as: :profile, dependent: :destroy
  has_one :profile, :class_name => "Employer::Profile"
  has_many :jobs, :dependent => :destroy

  def can_apply_to(job)
    false
  end
end
