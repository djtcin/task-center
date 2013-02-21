class CreateSubmissions < ActiveRecord::Migration
  def up
    create_table :submissions do |t|
      t.datetime :lastUpdate
      t.text :comment
      t.decimal :grade
      t.boolean :submitted
      t.integer :studentId
      t.datetime :remember
      t.boolean :viewed
      t.references :task
      t.references :user

      t.timestamps
    end
    add_index :submissions, :task_id
    add_index :submissions, :user_id
  end
  
  def down
    drop_table :submissions
    drop_table :configurations
  end
end
