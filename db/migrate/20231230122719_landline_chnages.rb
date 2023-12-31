class LandlineChnages < ActiveRecord::Migration[7.0]
  def change
    remove_column :faculties, :landline_office
  end
end
