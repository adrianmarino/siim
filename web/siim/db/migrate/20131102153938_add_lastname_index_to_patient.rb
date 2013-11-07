class AddLastnameIndexToPatient < ActiveRecord::Migration
	def change
		add_index :patients, :lastname
	end
end
