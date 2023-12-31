class AddCustomOrderToDepartments < ActiveRecord::Migration[7.0]
  def change
    add_column :departments, :custom_order, :integer
  end
end
