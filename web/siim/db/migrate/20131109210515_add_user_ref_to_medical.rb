class AddUserRefToMedical < ActiveRecord::Migration
	def change
		change_table :medicals do |a_table|
			a_table.references :user
		end
	end
end
