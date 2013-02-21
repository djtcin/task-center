class CreateTasks < ActiveRecord::Migration
  def up
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.boolean :status
      t.boolean :public
      t.boolean :autolock
      t.integer :hasComment
      t.integer :hasArchives
      t.references :space

      t.timestamps
    end
    add_index :tasks, :space_id
  end
  
  def down
    drop_table :tasks
  end
  
end
