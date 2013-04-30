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
end
