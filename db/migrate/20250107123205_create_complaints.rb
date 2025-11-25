class CreateComplaints < ActiveRecord::Migration[7.0]
  def change
    create_table :complaints do |t|
      t.string :telephone
      t.string :kind
      t.boolean :status, default: false
      t.boolean :bsnlstatus, default: false
      t.datetime :status_changed_at
      t.datetime :bsnlstatus_changed_at

      t.timestamps
    end
    add_index :complaints, :telephone
  end
end
