class Employer < User
  has_one :user, as: :profile, dependent: :destroy
  has_one :profile, :class_name => "Employer::Profile"
end
