class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.datetime :lastUpdate
      t.text :comment
      t.decimal :grade
      t.boolean :submitted
      t.integer :studentId
      t.datetime :remember
      t.boolean :viewed
      t.references :task

      t.timestamps
    end
    add_index :submissions, :task_id
  end
end
