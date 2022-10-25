# frozen_string_literal: true

class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members, id: false do |t|
      t.primary_key :member_id
      t.boolean :is_admin, default: false
      t.boolean :is_supervisor, default: false
      t.numeric :leaderboard_points

      t.timestamps
    end
  end
end
