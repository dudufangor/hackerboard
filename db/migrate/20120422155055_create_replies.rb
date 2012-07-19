class CreateReplies < ActiveRecord::Migration
  def up
    create_table :replies do |t|
      t.text :body, :null => false
      t.integer :user_id, :null => false
      t.integer :question_id, :null => false
      t.timestamps
    end

    add_index :replies, :user_id
    add_index :replies, :question_id
  end

  def down
    drop_table :replies
  end
end
