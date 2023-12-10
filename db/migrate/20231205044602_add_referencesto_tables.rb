class AddReferencestoTables < ActiveRecord::Migration[7.0]
  def change
    add_reference :faculties, :department, foreign_key: true
  end
end
