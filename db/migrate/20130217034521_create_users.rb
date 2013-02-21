class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, :primary_key => :redu_id do |t|
      t.integer :redu_id
      t.string :name
      t.string :email
      t.string :login
      t.string :pic
      t.string :token
      t.boolean :student
      t.datetime :rememberDefault
      t.boolean :emailNewTask
      t.boolean :emailChangeTask
      t.boolean :emailNewGrade
      
      t.timestamps
    end
  end
end
