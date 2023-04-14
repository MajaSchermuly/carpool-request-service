class AddAcceptNgStationToNdrs < ActiveRecord::Migration[6.1]
  def change
    add_column :ndrs, :accept_ng_station, :boolean, default: false
  end
end
