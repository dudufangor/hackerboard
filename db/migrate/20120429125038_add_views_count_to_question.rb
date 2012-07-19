class AddViewsCountToQuestion < ActiveRecord::Migration
  def up
    add_column :questions, :views_count, :integer, :default => 0, :null => 0
  end

  def down
    remove_column :questions, :views_count
  end
end
