class RemoveUnitFromFaculty < ActiveRecord::Migration[7.0]
  def change
    remove_column :faculties, :unit_id
  end
end
