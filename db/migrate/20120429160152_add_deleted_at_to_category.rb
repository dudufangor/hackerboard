class AddDeletedAtToCategory < ActiveRecord::Migration
  def up
    add_column :categories, :deleted_at, :datetime
  end

  def down
    remove_column :categories, :deleted_at
  end
end