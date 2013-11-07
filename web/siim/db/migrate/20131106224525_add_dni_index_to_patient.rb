class AddDniIndexToPatient < ActiveRecord::Migration
	def change
		add_index :patients, :dni
	end
end
