class CreateAchievements < ActiveRecord::Migration[7.0]
  def change
    create_table :achievements do |t|
      t.text :description
      t.integer :year

      t.timestamps
    end
    add_reference :achievements, :faculty, foreign_key: true
  end
end
