class Jobs::DashboardController < ApplicationController
  before_action :authenticate_employer!
  before_action :correct_employer

  def show
    @job = Job.find(params[:id])
    @applicants = []

    @job.applications.each do |applications|
      @applicants << Candidate::Profile.find_by(candidate_id: applications.candidate_id)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end
end
