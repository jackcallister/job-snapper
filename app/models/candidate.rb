class Candidate < User
  has_one :user, as: :profile, dependent: :destroy
  has_one :profile, :class_name => "Candidate::Profile"
  has_many :applications, :dependent => :destroy

  def has_profile?
    self.profile ? true : false
  end

  def can_apply_to(job)
    if Application.exists?(candidate_id: self.id, job_id: job.id)
      return false
    else
      return true
    end
  end
end
