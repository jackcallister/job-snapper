class Applicant::ApplicationController < ApplicationController
  before_action :authenticate_candidate!, :only => [:create, :destroy]
  before_action :authenticate_employer!, :only => [:accept, :reject, :unaccept]
  before_action :correct_candidate, :only => [:destroy]
  before_action :correct_employer, :only => [:accept, :reject, :unaccept]
  before_action :applyable_candidate, :only => [:create]

  def accept
    if @application.job.positions_available == 0
      return redirect_to job_applications_path(@application.job.id), :notice => "All available positions have been filled."
    else
      @application.job.positions_available -= 1
    end
    @application.job.save
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

  def reject
    jobs_positions_available = @application.job.positions_available += 1
    if @application.job.positions < jobs_positions_available
      @application.status = false
    else
      @application.job.save
      @application.status = false
    end

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
    @application.job.positions_available += 1

    @application.job.save
    @application.status = nil

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

  def destroy
    @application.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
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
      redirect_to profile_new_candidate_path, :notice => "You should complete your profile before applying to a job."
    end
  end

  def correct_candidate
    @application = current_candidate.applications
    redirect_to root_url if @application.nil?
  end

  def correct_employer
    @application = Application.find(params[:id])
    job = Job.find(@application.job_id)
    redirect_to root_url unless job.employer_id == current_employer.id
  end
end