class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.text :detail
      t.float :price

      t.timestamps
    end
  end
end
