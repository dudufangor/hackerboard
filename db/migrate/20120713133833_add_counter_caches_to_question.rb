class AddCounterCachesToQuestion < ActiveRecord::Migration
  def up
  	add_column :questions, :replies_count, :integer, :default => 0 
  end

  def down
   	drop_column :questions, :replies_count
  end
end
