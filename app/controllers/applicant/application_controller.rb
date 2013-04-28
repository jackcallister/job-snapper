class Applicant::ApplicationController < ApplicationController
  before_action :authenticate_candidate!

  def create
    @application = Application.new(application_params)

    respond_to do |format|
      if @application.save
        format.html { redirect_to root_url, notice: "Application successfully submitted." }
        format.json { render json: @application, status: :created, location: @application }
      else
        format.html { render @application }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def application_params
    params.require(:application).permit(
      :candidate_id,
      :job_id
      )
  end
end