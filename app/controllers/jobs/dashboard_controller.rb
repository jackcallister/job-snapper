class Jobs::DashboardController < ApplicationController
  before_action :authenticate_employer!
  before_action :correct_employer

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  def correct_employer
    @job = current_employer.jobs.find(params[:id])
    redirect_to root_url if @job.nil?
  end
end
