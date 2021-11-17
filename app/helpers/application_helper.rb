# frozen_string_literal: true

module ApplicationHelper
  def status_pin_helper(status)
    case status
    when 'open'
      '/images/conditions/OPEN.png'
    when 'warning'
      '/images/conditions/WARNING.png'
    when 'close'
      '/images/conditions/CLOSE.png'
    else
      ''
    end
  end
end
