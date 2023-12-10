class Removetelephone < ActiveRecord::Migration[7.0]
  def change
    remove_column :faculties, :telephone
  end
end
