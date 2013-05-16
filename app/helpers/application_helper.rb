module ApplicationHelper

  def flash_class(level)
    case level
    when :success then "success"
    when :notice then "info"
    when :error then "error"
    when :alert then "warning"
    end
  end

  def application_status_class(application)
    if application.rejected?
      return "error"
    elsif application.pending?
      return "warning"
    elsif application.accepted?
      return "success"
    end
  end

  def current_user
    if current_candidate
      return current_candidate
    elsif current_employer
      return current_employer
    else
      Guest.new
    end
  end

  def employers_dashboard_path_class
    if params[:action] == 'dashboard' || params[:controller] == 'employers/dashboard'
      return 'active'
    elsif Job.where(employer_id: current_employer.id, id: params[:id])
      return 'active'
    end
  end
end
