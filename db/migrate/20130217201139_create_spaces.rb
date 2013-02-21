class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces, :primary_key => :redu_id do |t|
      t.integer :redu_id

      t.timestamps
    end
  end
end
