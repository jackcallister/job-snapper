class JobsController < ApplicationController
  before_action :authenticate_employer!, except: [:show, :index]
  before_action :correct_employer, only: [:destroy, :update, :edit]
  before_action :assign_candidate, only: [:show]
  before_action :setup_application, only: [:show]

  def index
    @jobs = Job.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @jobs }
    end
  end

  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job }
    end
  end

  def create
    @job = current_employer.jobs.build(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to root_url, notice: "Job successfully created." }
        format.json { render json: @job, status: :created, location: @job }
      else
        format.html { render @job }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  def update
    respond_to do |format|
      if @job.update_attributes(job_params)
        format.html { redirect_to root_url, notice: 'Job was successfully updated.' }
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

  def job_params
    params.require(:job).permit(
      :company,
      :type_id,
      :category_id,
      :pay_rate_id,
      :employer_id
      )
  end

  def correct_employer
    @job = current_employer.jobs.find_by(id: params[:id])
    redirect_to root_url if @job.nil?
  end

  def assign_candidate
    return if current_candidate.nil?
    @candidate = current_candidate
  end

  def setup_application
    return if current_candidate.nil?
    @application = Application.new(candidate_id: current_candidate.id, job_id: params[:id])
    params[:application] = @application
  end
end
