module ApplicationHelper
  def set_status_pin_helper(status)
    if status == "open"
      '/images/conditions/OPEN.png'
    elsif status == "warning"
      '/images/conditions/WARNING.png'
    elsif status == "close"
      '/images/conditions/CLOSE.png'
    else
      ''
    end
  end
end
