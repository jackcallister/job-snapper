class Employers::DashboardController < ApplicationController
  before_action :authenticate_employer!

  def show
    @jobs = Job.where(:employer_id => current_employer.id)
  end
end
