class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.string :name
      t.string :format
      t.integer :size
      t.references :submission
      
      t.timestamps
    end
    add_index :archives, :submission_id
  end
  
end
