class AddDisplayIdToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :display_id, :integer
  end
end
