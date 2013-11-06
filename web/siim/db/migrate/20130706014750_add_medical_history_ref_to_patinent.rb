class AddMedicalHistoryRefToPatinent < ActiveRecord::Migration
	def change
		change_table :patients do |a_table|
			a_table.references :medical_history
		end
	end
end
