# frozen_string_literal: true

module ApplicationHelper
  def map_alert_type(type)
    case type.to_sym
    when :notice, :success
      'success'
    when :alert, :error
      'danger'
    else
      'secondary'
    end
  end
end
