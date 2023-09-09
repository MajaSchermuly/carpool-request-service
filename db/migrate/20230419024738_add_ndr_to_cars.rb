# frozen_string_literal: true

class AddNdrToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :ndr_id, :integer
  end
end
