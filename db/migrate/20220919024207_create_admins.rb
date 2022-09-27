# frozen_string_literal: true

class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins, id: false do |t|
      t.primary_key :admin_id
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
