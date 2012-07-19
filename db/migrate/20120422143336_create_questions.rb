class CreateQuestions < ActiveRecord::Migration
  def up
    create_table :questions do |t|
      t.string :title, :null => false
      t.text :body, :null => false

      t.integer :user_id, :null => false
      t.integer :category_id, :null => false

      # t.references :user, :null => false
      # t.references :category, :null => false

      t.timestamps
    end

    add_index :questions, :user_id
  end

  def down
    drop_table :questions
  end
end
