class AddColumntoLandlineOffice < ActiveRecord::Migration[7.0]
  def change
    remove_column :faculties, :position1, :integer
    remove_column :faculties, :position2, :integer
    remove_column :faculties, :designation, :integer
    add_column :faculties, :landline_office_intercom, :integer
    add_column :faculties, :landline_office_direct, :integer
  end
end
