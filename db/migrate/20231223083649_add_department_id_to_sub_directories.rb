class AddDepartmentIdToSubDirectories < ActiveRecord::Migration[7.0]
  def change
    add_column :sub_directories, :department_id, :integer
  end
end
