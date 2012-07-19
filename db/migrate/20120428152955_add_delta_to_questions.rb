class AddDeltaToQuestions < ActiveRecord::Migration
  def up
    add_column :questions, :delta, :boolean, :default => true, :null => false
  end

  def down
    remove_column :questions, :delta
  end
end
