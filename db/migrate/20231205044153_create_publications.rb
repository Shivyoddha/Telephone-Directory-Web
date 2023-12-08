class CreatePublications < ActiveRecord::Migration[7.0]
  def change
    create_table :publications do |t|
      t.text :description

      t.timestamps
    end
  end
end
