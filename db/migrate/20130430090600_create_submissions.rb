class CreateSubmissions < ActiveRecord::Migration
  def up
    create_table :submissions do |t|
      t.string :comment
      t.decimal :grade
      t.datetime :lastupdate
      t.datetime :remember
      t.boolean :submitted
      t.boolean :viewed
      t.references :task
      t.integer :user_id

      t.timestamps
    end
    add_index :submissions, :task_id
  end
  
   def down
    drop_table :submissions
  end
  
end
