# frozen_string_literal: true

class ChangeNdrIdToNullCars < ActiveRecord::Migration[6.1]
  def change
    change_column_null :cars, :ndr_id, true
  end
end
