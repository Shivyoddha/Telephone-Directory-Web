class AddPositionsToFaculties < ActiveRecord::Migration[7.0]
  def change
    add_reference :faculties, :position1, foreign_key: { to_table: :positions }
    add_reference :faculties, :position2, foreign_key: { to_table: :positions }
  end
end
