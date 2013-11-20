class AddMedicalHistoryIndexToDiseases < ActiveRecord::Migration
	def change
		add_index :diseases, :medical_history_id
	end
end
