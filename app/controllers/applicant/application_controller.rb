class Applicant::ApplicationController < ApplicationController
  before_action :authenticate_candidate!, :only => [:create]
  before_action :authenticate_employer!, :only => [:accept, :remove, :unaccept]
  before_action :correct_employer, :only => [:accept, :remove, :unaccept]
  before_action :applyable_candidate, :only => [:create]

  def accept
    @application.status = true

    respond_to do |format|
      if @application.save
        format.html { redirect_to job_applications_path(@application.job.id), notice: "Application successfully accepted." }
        format.json { render json: @application, status: :created, location: @application }
      else
        format.html { render @application }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove
    @application.status = false

    respond_to do |format|
      if @application.save
        format.html { redirect_to job_applications_path(@application.job_id), notice: "Application was removed." }
        format.json { render json: @application, status: :created, location: @application }
      else
        format.html { render @application }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  def unaccept
    @application.status = nil

    respond_to do |format|
      if @application.save
        format.html { redirect_to job_applications_path(@application.job_id), notice: "Application was unaccepted." }
        format.json { render json: @application, status: :created, location: @application }
      else
        format.html { render @application }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @application = Application.new(application_params)

    respond_to do |format|
      if @application.save
        format.html { redirect_to @application.job, notice: "Application successfully submitted." }
        format.json { render json: @application, status: :created, location: @application }
      else
        format.html { render @application }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def application_params
    params.require(:application).permit(
      :candidate_id,
      :job_id
      )
  end

  def applyable_candidate
    if current_candidate.profile.nil?
      redirect_to new_candidates_profiles_path, :notice => "You should complete your profile before applying to a job."
    end
  end

  def correct_employer
    @application = Application.find(params[:id])
    job = Job.find(@application.job_id)
    redirect_to root_url unless job.employer_id == current_employer.id
  end
end