class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.boolean :status
      t.boolean :public
      t.boolean :autolock
      t.integer :hasComment
      t.integer :hasArchives

      t.timestamps
    end
  end
end
