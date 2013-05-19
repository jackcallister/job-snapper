class PagesController < ApplicationController
  before_filter :authenticate!, except: [:home]

  def home
    if current_candidate
      return redirect_to jobs_path
    elsif current_employer
      return redirect_to employers_dashboard_path
    else
      render :layout => "home"
    end
  end
end
