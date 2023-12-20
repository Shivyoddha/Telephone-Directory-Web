class AddIsSubDirectoryToUnits < ActiveRecord::Migration[7.0]
  def change
    add_column :units, :is_sub_directory, :boolean
  end
end
