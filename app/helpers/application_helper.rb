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
      return ""
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
end
