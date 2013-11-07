class AddMedicalHistoryRefToAntecedent < ActiveRecord::Migration
	def change
		change_table :antecedents do |a_table|
			a_table.references :medical_history
		end
	end
end
