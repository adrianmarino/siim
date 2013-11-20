class AddMedicalHistoryIndexToPatients < ActiveRecord::Migration
	def change
		add_index :patients, :medical_history_id
	end
end
