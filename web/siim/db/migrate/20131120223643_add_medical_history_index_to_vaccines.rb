class AddMedicalHistoryIndexToVaccines < ActiveRecord::Migration
	def change
		add_index :vaccines, :medical_history_id
	end
end
