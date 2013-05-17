class Jobs::ApplicationsController < ActionController::Base

  def index
    @job = Job.find(params[:job_id])
    render :layout => "application"
  end

  def show
    @job = Job.find(params[:job_id])
    @application = Application.find(params[:id])
    @candidate = Candidate.find(@application.candidate_id)
    @candidate_profile = Candidate::Profile.find(@application.candidate_id)
    render :layout => "application"
  end
end
