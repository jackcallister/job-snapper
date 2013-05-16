module FormHelper

  def control_group_error(obj, field_name)
    "error" unless obj.errors[field_name].blank?
  end

  def error_help_text(obj, field_name, padding = "")
    "<span class='help-inline #{padding}'>#{obj.errors[field_name].join(", ")}</span>".html_safe unless obj.errors[field_name].blank?
  end
end