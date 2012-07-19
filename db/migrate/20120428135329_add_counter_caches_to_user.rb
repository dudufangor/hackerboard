class AddCounterCachesToUser < ActiveRecord::Migration
  def up
    add_column :users, :questions_count, :integer, :default => 0
    add_column :users, :replies_count, :integer, :default => 0
  end

  def down
    remove_column :users, :questions_count
    remove_column :users, :replies_count
  end
end
