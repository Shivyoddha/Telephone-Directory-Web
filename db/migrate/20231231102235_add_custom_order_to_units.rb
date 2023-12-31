class AddCustomOrderToUnits < ActiveRecord::Migration[7.0]
  def change
    add_column :units, :custom_order, :integer
  end
end
