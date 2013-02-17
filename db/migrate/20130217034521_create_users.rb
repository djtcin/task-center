class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :login
      t.integer :redu_id
      t.string :pic
      t.string :token
      t.boolean :student
      
      t.timestamps
    end
  end
end
