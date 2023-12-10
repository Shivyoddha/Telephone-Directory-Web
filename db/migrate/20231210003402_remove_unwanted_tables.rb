class RemoveUnwantedTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :achievements
    drop_table :interests
    drop_table :significant_projects
    drop_table :academic_backgrounds
    drop_table :publications
  end
end
