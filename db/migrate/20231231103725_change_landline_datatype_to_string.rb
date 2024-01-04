class ChangeLandlineDatatypeToString < ActiveRecord::Migration[7.0]
  def change
    change_column :faculties, :landline_residential, :string
    change_column :faculties, :landline_office_intercom, :string
    change_column :faculties, :landline_office_direct, :string
  end
end
