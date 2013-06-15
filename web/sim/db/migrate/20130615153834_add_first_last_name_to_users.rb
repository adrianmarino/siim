class AddFirstNameToUsers < ActiveRecord::Migration
  def up
  	change_table :users do |a_table|
      t.string :first_name, :null => false, :default => ""
      t.string :last_name, :null => false, :default => ""
      t.string :dni, :null => false, :default => ""
  	end
  end

  def down
  	change_table :user do |a_table|
  		a_table.remove :first_name, :last_name, :dni
  	end
  end
end
