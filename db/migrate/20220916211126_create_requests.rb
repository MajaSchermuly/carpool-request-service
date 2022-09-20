# frozen_string_literal: true

class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests, id: false do |t|
      t.primary_key :request_id
      t.integer :rider_id
      t.datetime :date
      t.string :pick_up_loc
      t.string :drop_off_loc
      t.integer :num_passengers
      t.string :attire
      t.string :additional_info

      t.timestamps
    end
  end
end
