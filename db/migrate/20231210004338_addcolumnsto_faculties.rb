class AddcolumnstoFaculties < ActiveRecord::Migration[7.0]
  def change
    add_column :faculties, :position1, :string
    add_column :faculties, :position2, :string
    add_column :faculties, :mobile1, :integer
    add_column :faculties, :mobile2, :integer
    add_column :faculties, :landline_office, :integer
    add_column :faculties, :landline_residential, :integer
    add_column :faculties, :designation, :string
  end
end
