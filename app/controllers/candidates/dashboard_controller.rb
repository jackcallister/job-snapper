class Candidates::DashboardController < ApplicationController
  before_action :authenticate_candidate!

  def index
    @applications = Application.where(candidate_id: current_candidate.id)
  end
end
