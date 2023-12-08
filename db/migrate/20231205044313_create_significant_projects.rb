class CreateSignificantProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :significant_projects do |t|
      t.string :title

      t.timestamps
    end
  end
end
