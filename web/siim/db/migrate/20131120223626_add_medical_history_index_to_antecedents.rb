class AddMedicalHistoryIndexToAntecedents < ActiveRecord::Migration
	def change
		add_index :antecedents, :medical_history_id
	end
end
