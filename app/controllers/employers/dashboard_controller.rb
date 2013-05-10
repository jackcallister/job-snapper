class Employers::DashboardController < ApplicationController
  before_action :authenticate_employer!

  def index
    @jobs = Job.where(:employer_id => current_employer.id)
  end

  def show
    @job = Job.find(params[:job_id])
  end
end
