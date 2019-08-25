class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.text :detail
      t.float :price
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
