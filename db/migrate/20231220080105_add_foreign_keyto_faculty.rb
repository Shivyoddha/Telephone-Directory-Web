class AddForeignKeytoFaculty < ActiveRecord::Migration[7.0]
  def change
    add_reference :faculties, :sub_directory, foreign_key: true
  end
end
