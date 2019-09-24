class AddAasmStateToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :aasm_state, :string, limit: 100
  end
end
