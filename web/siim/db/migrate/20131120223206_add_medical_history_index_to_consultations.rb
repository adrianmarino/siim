class AddMedicalHistoryIndexToConsultations < ActiveRecord::Migration
	def change
		add_index :consultations, :medical_history_id
	end
end
