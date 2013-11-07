class CreateAssignments < ActiveRecord::Migration
	def change
		create_table :assignments do |a_table|
			a_table.references :user
			a_table.references :role

			a_table.timestamps
		end
	end
end
