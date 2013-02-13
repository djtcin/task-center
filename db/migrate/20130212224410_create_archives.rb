class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.string :name
      t.string :format
      t.integer :size

      t.timestamps
    end
  end
end
