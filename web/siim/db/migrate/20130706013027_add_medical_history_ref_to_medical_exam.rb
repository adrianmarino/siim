class AddMedicalHistoryRefToMedicalExam < ActiveRecord::Migration
	def change
		change_table :medical_exams do |a_table|
			a_table.references :medical_history
		end
	end
end
