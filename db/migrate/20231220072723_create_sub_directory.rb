class CreateSubDirectory < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_directory do |t|
      t.string :title

      t.timestamps
    end
  end
end
