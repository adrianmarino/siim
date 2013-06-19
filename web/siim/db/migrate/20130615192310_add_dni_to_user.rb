class AddDniToUser < ActiveRecord::Migration
  	change_table :users do |a_table|
      a_table.string :dni, :null => false, :default => ""
  	end
    add_index :users, :dni, :unique => true
end
