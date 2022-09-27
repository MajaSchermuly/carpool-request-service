# frozen_string_literal: true

class CreateRiders < ActiveRecord::Migration[6.1]
  def change
    create_table :riders, id: false do |t|
      t.primary_key :rider_id
      t.string :phone_number
      t.string :first_name
      t.string :last_name
      t.string :local_address
      t.integer :emergency_contact_id

      t.timestamps
    end
  end
end
