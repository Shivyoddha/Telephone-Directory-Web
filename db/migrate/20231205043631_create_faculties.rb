class CreateFaculties < ActiveRecord::Migration[7.0]
  def change
    create_table :faculties do |t|
      t.string :name
      t.string :phoneno
      t.string :email
      t.string :telephone
      t.string :site_name
      t.date :joining_date

      t.timestamps
    end
  end
end
