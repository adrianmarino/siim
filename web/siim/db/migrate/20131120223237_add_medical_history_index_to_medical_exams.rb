class AddMedicalHistoryIndexToMedicalExams < ActiveRecord::Migration
	def change
		add_index :medical_exams, :medical_history_id
	end
end
