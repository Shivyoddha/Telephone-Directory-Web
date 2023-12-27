class CreateDepartmentsSubDirectoriesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :departments_sub_directories, id: false do |t|
      t.belongs_to :department
      t.belongs_to :sub_directory
    end

    add_index :departments_sub_directories, [:department_id, :sub_directory_id], unique: true, name: 'index_dep_sub_dir_on_ids'
  end
end
