class AddReferenceToFaculty < ActiveRecord::Migration[7.0]
  def change

    add_reference :faculties, :unit,  foreign_key: true
  end
end
