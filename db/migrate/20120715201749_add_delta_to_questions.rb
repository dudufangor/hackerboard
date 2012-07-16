class AddDeltaToQuestions < ActiveRecord::Migration
  def up
  	add_column :articles, :delta, :boolean, :default => true, :null => false
  end

  def down
  	  remove_column :articles  	
  end
end
