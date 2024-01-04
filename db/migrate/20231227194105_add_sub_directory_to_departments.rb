class AddSubDirectoryToDepartments < ActiveRecord::Migration[7.0]
  def change
    add_reference :departments, :sub_directory, foreign_key: true
  end
end
