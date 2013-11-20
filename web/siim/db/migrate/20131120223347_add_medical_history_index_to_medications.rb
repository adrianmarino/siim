class AddMedicalHistoryIndexToMedications < ActiveRecord::Migration
	def change
		add_index :medications, :medical_history_id
	end
end
