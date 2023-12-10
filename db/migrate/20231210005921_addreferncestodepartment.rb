class Addreferncestodepartment < ActiveRecord::Migration[7.0]
  def change
    add_reference :departments, :unit, foreign_key: true
    remove_column :faculties, :phoneno
  end
end
