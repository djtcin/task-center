class AlterSubmissions < ActiveRecord::Migration
  def change
      add_column :submissions, :archivetxt, :string  
  end
end
