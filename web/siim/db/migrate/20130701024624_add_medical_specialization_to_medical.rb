class AddMedicalSpecializationToMedical < ActiveRecord::Migration
	def change
		change_table :medicals do |a_table|
			a_table.references :medical_specialization
		end
	end
end
