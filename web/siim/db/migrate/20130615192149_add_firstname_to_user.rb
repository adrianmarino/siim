class AddFirstnameToUser < ActiveRecord::Migration
  def change
		change_table :users do |a_table|
      a_table.string :first_name, :null => false, :default => ""
  	end
  end
end
