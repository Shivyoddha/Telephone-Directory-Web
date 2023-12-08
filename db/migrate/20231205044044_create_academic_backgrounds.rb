class CreateAcademicBackgrounds < ActiveRecord::Migration[7.0]
  def change
    create_table :academic_backgrounds do |t|
      t.string :degree
      t.string :college
      t.integer :year

      t.timestamps
    end
  end
end
