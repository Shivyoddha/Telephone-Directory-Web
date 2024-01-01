class AddForeignToUser < ActiveRecord::Migration[7.0]
  def change
    remove_reference :users, :department, foreign_key: true
    create_table :users_departments, id: false do |t|
      t.belongs_to :user
      t.belongs_to :department
    end

    add_index :users_departments, [:user_id, :department_id], unique: true, name: 'index_user_dep_on_ids'
  end
end
