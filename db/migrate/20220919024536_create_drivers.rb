# frozen_string_literal: true

class CreateDrivers < ActiveRecord::Migration[6.1]
  def change
    create_table :drivers, id: false do |t|
      t.primary_key :driver_id
      t.string :phone_number
      t.string :first_name
      t.string :last_name
      t.string :car_model
      t.datetime :check_in_time

      t.timestamps
    end
  end
end
