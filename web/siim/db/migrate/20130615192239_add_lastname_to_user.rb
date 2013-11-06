class AddLastnameToUser < ActiveRecord::Migration
	def change
		change_table :users do |a_table|
			a_table.string :last_name, :null => false, :default => ""
		end
	end
end
