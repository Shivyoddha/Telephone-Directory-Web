class AddReferencestoTables < ActiveRecord::Migration[7.0]
  def change
    add_reference :interests, :faculty, foreign_key: true
    add_reference :academic_backgrounds, :faculty, foreign_key: true
    add_reference :publications, :faculty, foreign_key: true
    add_reference :significant_projects, :faculty, foreign_key: true
    add_reference :faculties, :department, foreign_key: true
  end
end
