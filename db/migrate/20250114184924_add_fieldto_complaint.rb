class AddFieldtoComplaint < ActiveRecord::Migration[7.0]
  def change
    add_column :complaints, :additional_detail, :text
  end
end
