module ApplicationHelper
	def flash_class(type)
    case type
    when :alert
      "danger"
    when :notice
      "primary"
    else
      ""
    end
  end
end
