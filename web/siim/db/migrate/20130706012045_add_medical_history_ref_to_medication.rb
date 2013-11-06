class AddMedicalHistoryRefToMedication < ActiveRecord::Migration
	def change
		change_table :medications do |a_table|
			a_table.references :medical_history
		end
	end
end
