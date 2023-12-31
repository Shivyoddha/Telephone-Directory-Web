class AddCustomOrderToFaculties < ActiveRecord::Migration[7.0]
  def change
    add_column :faculties, :custom_order, :integer
  end
end
