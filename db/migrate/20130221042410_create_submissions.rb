class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :comment
      t.decimal :grade
      t.datetime :lastupdate
      t.datetime :remember
      t.boolean :submitted
      t.boolean :viewed
      t.references :task
      t.references :user

      t.timestamps
    end
    add_index :submissions, :task_id
    add_index :submissions, :user_id
  end
end
