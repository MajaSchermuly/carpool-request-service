# frozen_string_literal: true

module AssignmentsHelper
  # finds the time ridden (in minutes)
  def time_rode(assignment)
    # making sure drop off time was specified
    if assignment.drop_off_time
      "#{((assignment.drop_off_time.to_datetime - assignment.created_at.to_datetime) * 24 * 60).to_i}m"
    # otherwise default to ''
    else
      ''
    end
  end

  # finds the time returned home (HH:MM)
  def time_home(assignment)
    # making sure drop off time was specified
    if assignment.drop_off_time
      assignment.drop_off_time.to_datetime.in_time_zone('Central Time (US & Canada)').strftime('%I:%M %p')
    # otherwise default to ''
    else
      ''
    end
  end
end
