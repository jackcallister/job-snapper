class JobsController < ApplicationController
  before_action :authenticate_employer!, except: [:show, :index]
  before_action :correct_employer, only: [:edit, :update, :destroy]
  before_action :application_status, only: [:show]
  before_action :build_application, only: [:show]

  def index
    @jobs = Job.paginate(:page => params[:page])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @jobs }
    end
  end

  def new
    @job = Job.new
    @categories = Category.all
    @types = Type.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job }
    end
  end

  def create
    @job = current_employer.jobs.build(job_params)
    @job.category = Category.find(params[:job][:category_id])
    @job.type = Type.find(params[:job][:type_id])

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: "Job successfully created." }
        format.json { render json: @job, status: :created, location: @job }
      else
        format.html { render @job }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @categories = Category.all
    @types = Type.all
  end

  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  def update
    @job.category = Category.find(params[:category_id])
    @job.type = Type.find(params[:type_id])

    respond_to do |format|
      if @job.update_attributes(job_params)
        format.html { redirect_to edit_job_path(@job), notice: 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private

  def build_application
    # An employer cannot apply for jobs, only registered candidates
    # and guests. If we are an employer the application form
    # won't be built. If we are a guest diverge off to build a
    # null set of parameters. If we are a candidate build the
    # appropriate params.
    if current_employer
      return
    elsif current_candidate.nil?
      build_guest_application
    else
      @application = Application.new(candidate_id: current_candidate.id, job_id: params[:id])
      params[:application] = @application
    end
  end

  def build_guest_application
    @application = Application.new(candidate_id: nil, job_id: params[:id])
    params[:application] = @application
  end

  def application_status
    if current_candidate.nil? && current_employer.nil?
      # User is a guest and can apply.
      @can_apply = true
    elsif current_employer
      # Employer cannot apply
      @can_apply = false
    elsif !current_candidate.can_apply?(params[:id])
      # Candidate has already applied to this job.
      @can_apply = false
    else
      # All that's left is a candidate that has not applied.
      @can_apply = true
    end
  end

  def correct_employer
    @job = current_employer.jobs.find_by(id: params[:id])
    redirect_to root_url if @job.nil?
  end

  def job_params
    params.require(:job).permit(
      :employer_id,
      :title,
      :company,
      :region_id,
      :city_id,
      :type_id,
      :category_id,
      :pay_rate_min,
      :pay_rate_max
      )
  end
end
