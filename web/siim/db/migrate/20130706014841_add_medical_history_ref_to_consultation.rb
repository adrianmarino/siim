class AddMedicalHistoryRefToConsultation < ActiveRecord::Migration
	def change
		change_table :consultations do |a_table|
			a_table.references :medical_history
		end
	end
end
