class AddFirstnameIndexToPatient < ActiveRecord::Migration
	def change
		add_index :patients, :firstname
	end
end
