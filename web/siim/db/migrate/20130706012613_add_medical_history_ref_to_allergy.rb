class AddMedicalHistoryRefToAllergy < ActiveRecord::Migration
	def change
		change_table :allergies do |a_table|
			a_table.references :medical_history
		end
	end
end
