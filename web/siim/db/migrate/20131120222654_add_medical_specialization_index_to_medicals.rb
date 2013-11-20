class AddMedicalSpecializationIndexToMedicals < ActiveRecord::Migration
	def change
		add_index :medicals, :medical_specialization_id
	end
end