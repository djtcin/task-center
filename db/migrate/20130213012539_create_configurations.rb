class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.integer :studentId
      t.datetime :rememberDefault
      t.boolean :emailNewTask
      t.boolean :emailChangeTask
      t.boolean :emailNewGrade

      t.timestamps
    end
  end
end
