class AddCounterCachesToQuestion < ActiveRecord::Migration
  def up
    add_column :questions, :replies_count, :integer, :default => 0
  end

  def down
    remove_column :questions, :replies_count
  end
end
