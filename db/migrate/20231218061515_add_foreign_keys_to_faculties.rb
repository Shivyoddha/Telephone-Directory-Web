class AddForeignKeysToFaculties < ActiveRecord::Migration[7.0]
  def change
    add_reference :faculties, :designation, foreign_key: true
  end
end
