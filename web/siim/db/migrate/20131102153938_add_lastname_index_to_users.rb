class AddLastnameIndexToPatient < ActiveRecord::Migration
	def change
		add_index :patients, :last_name
	end
end
