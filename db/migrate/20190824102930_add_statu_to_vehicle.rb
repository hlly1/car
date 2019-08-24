class AddStatuToVehicle < ActiveRecord::Migration[5.1]
  def change
    add_column :vehicles, :statu, :integer, :default => 1
  end
end
