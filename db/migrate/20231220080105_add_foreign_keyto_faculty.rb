class AddForeignKeytoFaculty < ActiveRecord::Migration[7.0]
  def change
    add_reference :faculties, :sub_directory, foreign_key: true
    remove_column :units, :issubsections
  end
end
