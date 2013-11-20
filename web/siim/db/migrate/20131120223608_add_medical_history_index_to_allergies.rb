class AddMedicalHistoryIndexToAllergies < ActiveRecord::Migration
	def change
		add_index :allergies, :medical_history_id
	end
end
