class Candidate < User
  has_one :user, as: :profile, dependent: :destroy
  has_one :profile, :class_name => "Candidate::Profile"

  def can_apply?(job_id)
    Application.where(candidate_id: self.id, job_id: job_id)
  end
end
