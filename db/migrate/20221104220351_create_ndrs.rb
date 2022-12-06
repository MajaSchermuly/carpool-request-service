# frozen_string_literal: true

class CreateNdrs < ActiveRecord::Migration[6.1]
  def change
    create_table :ndrs, id: false do |t|
      t.primary_key :ndr_id
      t.boolean :is_active
      t.boolean :button_override
      t.integer :member_id
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :members_needed, default: true
      t.integer :num_members_desired, default: 5
      t.integer :num_members_signed_up, default: 0
      t.boolean :dues_restrict, default: true
      t.boolean :training_restrict, default: true

      t.timestamps
    end
  end
end
