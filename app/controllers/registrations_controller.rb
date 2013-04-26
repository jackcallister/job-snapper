class RegistrationsController < Devise::RegistrationsController
  after_filter :initialize_profile, :only => [:create]

  def initialize_profile
    self.resource.build_profile.save
  end
end
