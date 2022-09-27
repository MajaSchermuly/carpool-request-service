# frozen_string_literal: true

class CreateCarRides < ActiveRecord::Migration[6.1]
  def change
    create_table :car_rides, id: false do |t|
      t.primary_key :car_ride_id
      t.integer :request_id
      t.integer :driver_id
      t.integer :queue_pos

      t.timestamps
    end
  end
end
