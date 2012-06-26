class CreateUsers < ActiveRecord::Migration
  def up
		create_table :users do |t|
			t.string :name, :null => false
			t.string :email, :null => false, :unique => true
			t.string :password_hash, :null => false
			t.string :password_salt, :null => false

			t.timestamps
  end

  def down
		drop table :users
  end
end
