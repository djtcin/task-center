class AlterUsers < ActiveRecord::Migration
  def change
      add_column :users, :space_id, :integer
      change_column :users, :redu_id, :integer
      add_column :users, :id, :primary_key
  end
end
