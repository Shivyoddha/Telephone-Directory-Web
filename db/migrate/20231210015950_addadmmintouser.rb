class Addadmmintouser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :super_admin, :boolean
    add_reference :users, :department, foreign_key: true
  end
end
