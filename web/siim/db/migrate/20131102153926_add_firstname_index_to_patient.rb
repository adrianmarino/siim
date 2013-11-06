class AddFirstnameIndexToPatient < ActiveRecord::Migration
	def change
		add_index :patients, :first_name
	end
end
