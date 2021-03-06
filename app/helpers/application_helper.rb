module ApplicationHelper
  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-danger"
        when :alert then "alert alert-warning"
    end
  end

  def formatted_event_date(event_date)
    event_date.try(:strftime, '%d/%m/%Y')
  end
end
