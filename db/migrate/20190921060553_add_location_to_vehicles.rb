class AddLocationToVehicles < ActiveRecord::Migration[5.1]
  def change
    add_column :vehicles, :location, :string
  end
end
