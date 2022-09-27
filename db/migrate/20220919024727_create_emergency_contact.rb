# frozen_string_literal: true

class CreateEmergencyContact < ActiveRecord::Migration[6.1]
  def change
    create_table :emergency_contacts, id: false do |t|
      t.primary_key :emergency_contact_id
      t.string :phone_number
      t.string :full_name
      t.string :relation

      t.timestamps
    end
  end
end
