class AddReturnCarToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :return_car, :integer, :default => 0
  end
end
