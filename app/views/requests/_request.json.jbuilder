# frozen_string_literal: true

json.extract! request, :request_id, :rider_id, :date_time, :pick_up_loc, :drop_off_loc, :num_passengers, :additional_info, :created_at, :updated_at
json.url request_url(request, format: :json)
